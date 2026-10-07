Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6022CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 06:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ww9Rf5+zUd3I8lKgj7ZcJpBY3E+QqurY64TBzZF1pbw=; b=EwQ2DRRe5NAPisgefMq3pyzNi4
	zIpKeehdTLL51duZJ9wGI0BeqfzPU0pXuLG5KRxmTHyxekHfgMk62SrIOJ4QCnSkuMXjLBCg/p5gO
	vSB9xdFiBZUUPztY4beUBlsoZcG9HcKLpVuWxVJ401/OoAGxT0M5gDu3T9NssqSOC3Baa8+xG7raK
	XPcn0yOFxGnSTPNz4KC8rXYklmT8vf3WhjbfFhjpeKiC1qUDDGThfhlaQ1Ra1EZaXRdbpxvFmv3/s
	mJz5ERnLQP60k1jnIvGH0v+Bi4dRKJi+j+oXLBbD8vk5WzdYsn0IKTXyt4zxnyw5YxUp0YqN37H1/
	ekOUoy/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELPe-00000001nTJ-1eoL;
	Wed, 07 Oct 2026 06:46:02 +0000
Received: from out-107.mta0.migadu.com ([2001:41d0:1004:224b::6b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELPa-00000001nS4-2iDV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 06:46:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ww9Rf5+zUd3I8lKgj7ZcJpBY3E+QqurY64TBzZF1pbw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355556; v=1; x=1791960356;
 b=VKmktvyjTTzxiCYLDYougWARjPlPzHSpKDLaPxOvazc/tpJUgIa//pw/1hoaciTX6VVZTQop
 wCzbJDarLgTHswDHZJLYDzVi6VGXUGSNU8Fisia9s3BPdIeGY7OU+z4o3U+AI7FmrzXc0DZv/mK
 KiVoovUHCzom3w3cFKvmMmFo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7b2cf838ea28a4f8;
	Wed, 07 Oct 2026 03:23:13 +0000
X-Mizu-Trace-ID: 7b2cf838ea28a4f8
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so2644e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 20:23:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzu+VBmmizpjPHkl3uvEGOIx7OEVZUaOJ3jqbKx6rh55Z+uFUR7tyAkTCN+tFksOhgRfQaskg23zo09qHYto5m9@lists.infradead.org
X-Gm-Message-State: AFq9FYIjaqu5mfUocchYrNkVG2bHGZvgW5N8MjS5eSkakos77/LfWM7f
	OjjAccPZAVWS/MIckgh3FyPLpP8q8RE7TfRqL+HpgIGXyUqCPX0NSjjns2FwfoWwH+wU04U3Eo2
	yqI4ahl7qcHmz2UaSBLy6PLaQ1nSGY+djyY3lb1Rn
X-Received: by 2002:a05:6512:6c8:b0:5bc:b2ec:eaee with SMTP id
 2adb3069b0e04-5bcca85f534mr214600e87.11.1791343392083; Tue, 06 Oct 2026
 20:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260925085000.753400-1-fuad.tabba@linux.dev>
In-Reply-To: <20260925085000.753400-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:22:35 +0200
X-Gmail-Original-Message-ID: <CA+EHjTzCG-vR1MFgMhuVtn3PFfW1rQjhGUBBgQawSw6ptsK-QA@mail.gmail.com>
X-Gm-Features: AclHuK9fHmZtY15hLIVYOST00PucFFzd3kB8VTW4flihZXSNcA5_glFGRDx4Dpo
Message-ID: <CA+EHjTzCG-vR1MFgMhuVtn3PFfW1rQjhGUBBgQawSw6ptsK-QA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] irqchip/gic-v3: Memory-safety fixes on the probe paths
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_234558_831684_5B259351 
X-CRM114-Status: UNSURE (   6.34  )
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

Hi Thomas,

Gentle ping on this series, which Marc has reviewed, and on the
lifetime and range fixes [1], which he has also reviewed.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260908142632.2795308-1-fuad.tabba@linux.dev/

