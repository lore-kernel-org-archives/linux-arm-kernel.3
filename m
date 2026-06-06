Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAA6CD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 20:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ur7qG5cLB2Gls5K5mQ7h9ecjj9T6I+5G5xBXAVBeHC0=; b=yRXf5fh7zigupJRhL7yePKJJI/
	zjXqCx4t3HIzQREJsv61krD2czrmlYk+CLLt/bUBIJQQz0WUbWwEJa4Iw/dySIUDaQlK4Bjt8ZasO
	a8BRFsk8Eh2DA3wGvLX65gEBJ1aG+3JAMpj+KmFKjmr+rVu+eZdbz/HXDGZbxDtb8W86dMYxdPn9Q
	HOyiZ+mhgZTrPOhjSF5yPE/5Z5rioLl4Gtyg4yv79hYXP2SwdkTZUxgrL36tec6AYvnYCPt3fdqy4
	I8PZ8W0xc9KuRRt4B/YaKaZMPdYwlzoesLm3FER60mKFnCJz87UzEAL50UB94PLlwoOkETKhzcgEr
	SkJe9QCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVxvJ-00000001oo6-3LKn;
	Sat, 06 Jun 2026 20:47:17 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVxvH-00000001onG-2TdK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 20:47:16 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-3045c195251so2736553eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 13:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780778834; x=1781383634; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ur7qG5cLB2Gls5K5mQ7h9ecjj9T6I+5G5xBXAVBeHC0=;
        b=GscJ7jlhQcnxu6QWRBAHZlpR+fhRsJsPdNtvyWHiimxkPx4mdqLOeqgOMC333ZeGIm
         d/NYtJSef1O9kIe5On5cGVa28IFdWb/DploLWf8zJ2ItXtb5O+pQdqJolx2+tFTbZBqq
         xuT0K8DsDwNHWsXrDjKuz/fMj8tJiF5qg7gUCxYBlPxFyDT2fQS/u4db/kcTS4iVQV/r
         xAN2VgOKITiC7VYR5aHwGRKYzSHgoyo1UsdlcedEiQh1ULUj/nhe2D41UTqS1nXYnZvr
         c8PNPToh61qmGkn8ECrio4xYhBDWjFgb/ynJfP3LmV0vqT4T3VC4Wfr3aQrlh2a9cjYO
         wUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780778834; x=1781383634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ur7qG5cLB2Gls5K5mQ7h9ecjj9T6I+5G5xBXAVBeHC0=;
        b=UeNBsVWnHjHU5mmjOz4/hgzzpH1NY9U74yrXYaqfpf6o/eJxHHM37do615RY3hW+gm
         fWwA43bFx9nMrLB9JI9vKikRKmDpwEVhzngjLT9EvSxRqtRQbVrZll84qwlx6NZLZSAz
         eMFhv1aMlv4vBxjHuJlEX3Dr+c/+LIAQucdA949UUmuvIzfHya5P/+zjCb3poa6DsdAD
         b82kJ9QmmqCxdGUTBjtvQbyNgNw1eLcNTbXdOMzS1a5OOckkxl7xWzLInELz0tTuF3oR
         0TTIVszzI7TKDB4b8tOWrAxXFuA9kKgEp4Fscr27HCJD2eemo1YGHenM2rl6TYm6PCMb
         bvRA==
X-Forwarded-Encrypted: i=1; AFNElJ/tqXFF8BGGdkxLjB6DOKQeoAYWLVznsBvbWgh4HOLKuUmugebTDcyU5ADnK8kUONccCmFDzV2WXzu/nawzYv5Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4sJ1B78jPYcSNKsHsGYWh3UC2akgl6GjLS/kNlYRbsVl3qf4u
	1wYr7iPe16jtCBDKmJsIG9hlIinNdRkfEljuHV9rHb6Re6RKAYySuS63
X-Gm-Gg: Acq92OGalyOzLRshP0TiqekLgy5kexboV4Exo3hyiAstzMtOsjKW+gtyks7ODJMMMzJ
	Bh24sr8ahEv74QkpRQMJHcztp0oviTybBNa16n2mvQEVzQ97LfI98U/fONKMg8gdOj8dYyaTNoB
	F7s+3oDM/GBlpXRSogQbsk7eAOQoQPGMStld54OpISwtne1ba49Qbf5hJipXq4wYX1OhmfN8Ium
	i5gLfD2HWXEJiaPdOxyKKNApd5Ep3Sz/mhWy1gr5NCQWH6JilvbdwG1E0xZ4JzJz9HX9Dfhn9uq
	iy+b3539+kauua91QpNDWozl5yxwNauVFn61LiTe7/Jj0SdpqXntK26ruCw4qHrnDdWXhk0QWJs
	iuemwWUfyIXjcCFa/qttIqAFuZeHSCIIqxlDnMfHtxKxBN9kzbbvgrot5BNOYPZdu3YcZl4Tcuc
	LU0KeScSoN/evSXMdYR6oWqIY49o89kQHaVeXsiNjEd9EcbuURXfDNPkPPnA+nrQN0twyXszRN1
	ws=
X-Received: by 2002:a05:7300:7488:b0:2cb:4b8f:b2bd with SMTP id 5a478bee46e88-3077af30ab5mr5573481eec.6.1780778833808;
        Sat, 06 Jun 2026 13:47:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bb2f:1c0b:386d:8909])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f716017esm12748510c88.15.2026.06.06.13.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 13:47:13 -0700 (PDT)
Date: Sat, 6 Jun 2026 13:47:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-input@vger.kernel.org, Michal Simek <michal.simek@amd.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] Input: xilinx_ps2 - remove driver
Message-ID: <aiSHSt_PWzaqalec@google.com>
References: <20260603054217.442016-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603054217.442016-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_134715_632718_31492E15 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jun 02, 2026 at 10:42:17PM -0700, Rosen Penev wrote:
> Remove the Xilinx XPS PS/2 controller driver. This driver supports an
> old Xilinx EDK IP core that is no longer in active use. The hardware
> is not available on modern platforms, and the driver has no users here.
> 
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied, thank you.

-- 
Dmitry

