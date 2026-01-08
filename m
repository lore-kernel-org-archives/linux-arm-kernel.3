Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F031D1489F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 05:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfTEXcf5zciGZot0fekZJidEbYo8hYFDlzJ4aD4mgVc=; b=cxpzy4DzUFWwtsKjWrqGYyhNBz
	7B8TejDqWE7pYUOa/iw5L0+LZMguY+RIXlxH9knP5lAXhtuzDkdPU8mkXJWThQ0S7mPj+Xy/jynCJ
	q918iCky6J3f0ARn2uDnxtoSzX4MxPy4BbzzyOFsQFtiixUhhiC6wmxF7aDjXvVgDh/yUfKzWLB+h
	xZEBIFqGpPkC9tPWXlxL34babhXIoTa36PsVsAXudnWWsr5Xk2oZ3afZfk3yb1rQhNNgu5nEhV3ms
	DOJ5dXZ1W4VNeWy/4KzSsuMRBfKUPuwKn1l/rlGKf9hOh4QUrrQEE0R37ii+Bk3UunRhcpvlB7DXF
	Vw0q4u1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdibA-0000000FxEh-2lCb;
	Thu, 08 Jan 2026 05:30:16 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdib7-0000000FxE2-3Z3d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 05:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767850211;
	bh=MfTEXcf5zciGZot0fekZJidEbYo8hYFDlzJ4aD4mgVc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Rm5e8stjXFPtDa9xewdJ1RB82WuVDvStDj2Lopa19weEhxIYhCWkjIDTKHVn0IqE9
	 8VvQgSrSR4bTvuYkBdS3urYWXj3HKZ30DFFl0Tf98STxAAO/9Gh6ywnRYQcUMsvjz1
	 Pwnu6yVxU5Y/10s9bvygwMO1b2wvMfeUCVOUJKf+NiEIekq8gJokbDCH57ZqiXcgkN
	 bRVKnK35RwaK6FljS8jziMgPR7Zc0KiD2Amh3UxFVKnV8F8nWFgwu+8yWffmLthPWZ
	 umyifu0JiDbfyObUG1Sd/Mhy8ySTe8UljQYU5JTR+f7mQWs++Rt+7e/UCLHhBBp/SZ
	 qumSRY1G/5eyA==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 218887C834;
	Thu,  8 Jan 2026 13:30:11 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, Cosmo Chou <chou.cosmo@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 cosmo.chou@quantatw.com
In-Reply-To: <20251219062948.528824-1-chou.cosmo@gmail.com>
References: <20251219062948.528824-1-chou.cosmo@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: bletchley: Remove try-power-role
 from connectors
Message-Id: <176785021104.871508.750215017284279406.b4-ty@codeconstruct.com.au>
Date: Thu, 08 Jan 2026 16:00:11 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_213014_091955_38EFF030 
X-CRM114-Status: UNSURE (   7.31  )
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

On Fri, 19 Dec 2025 14:29:48 +0800, Cosmo Chou wrote:
> Remove the "try-power-role = sink" property from all USB-C connectors.
> The try mechanism is unnecessary and wastes time during connection.
> Since power-role = "dual" is already configured, standard USB PD
> negotiation is sufficient and more efficient.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


