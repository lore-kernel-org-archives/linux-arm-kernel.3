Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E412CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 21:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gC9+4iTynloA2cHF6NCfusb6R3+csWJwJp2/KYeHI68=; b=dhbgDG7BYqU8xoSOUtpA/QlK0c
	Yia5jmti2n0EeTUFsANDuBFymXDnNcXxusgD079NtH6S6OZ48nBTWtQD+zhdr9gMwBGwrPYQyqfo8
	DiBDDLwKpeXT0j6xGJnjATijSSlUrldEGLKwN8tFI0nTLzWLt3JZCGM31QRjSMgQl9CSGOkf7+tzd
	B0uusGzXNnQ7SbO03pSM/A63CFj3jBYzgw49KdaCOml+/5zNA1DquA3jNUH7s9+DgsPlkY0WlGDcO
	oH4IMrMmygDCwnE1wkRYF/tUBKuY0YQWfvFtvLHMdkm1L9WMm6018ouVdwgqZVOR2b+jPFgdYegx6
	1PN7cfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfr1-00000004erO-0u1D;
	Tue, 29 Sep 2026 21:59:15 +0000
Received: from smtp5-g21.free.fr ([212.27.42.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfqy-00000004eq3-0Jjk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 21:59:14 +0000
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:fd38:7b91:be5e:6aee])
	(Authenticated sender: vjardin@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7B1C95FFAA;
	Tue, 29 Sep 2026 23:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1790719143;
	bh=cr5V+n/greApI8Zyhw+2u0aNrf/2IvsBktudjqmiqro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNoPtG9afk89bIDpSSwZpYx+lHCVs9Wsyv/laS8KKM0eqRGAjxlZleqPa51jjBBU5
	 CY7Q33HOgnqUtHj8opAsuXscshB9tSe+jXDsh+/IBv/vcGHmMqdN1bYjb4DteSNDPn
	 B9GDCmqWXGEAaFsiqKB6SN90MGeJKcqebtZORXaAGOryOrUupiWaLlc0JY3LkixbwL
	 ok5AJ2D+qJ/7MYK3yUMeKDeiAFz73Xpqj78QcL1TN6WCvq87mwuHEBaKYE3apNoPkK
	 E2prVdLk25A63Wb5VrAMU4px5KRDXSwyLkmnnsoNC+U20BeWfKKrlKF+G5RXl9sj2P
	 VzGB14XiP14Tg==
Date: Tue, 29 Sep 2026 23:58:49 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Carlos Song <carlos.song@nxp.com>,
	Haobin Jiang <lemonoutput@foxmail.com>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
Message-ID: <arw0mVbacAXv_1H7@L30177.local>
References: <20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr>
 <apcYp0Zc7CrJMiOh@lizhi-Precision-Tower-5810>
 <aqO9SMvI89rqoEGb@L23803.iliad.fr>
 <arMUxCW5ZTzLT3VN@L30177.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arMUxCW5ZTzLT3VN@L30177.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_145912_272794_CE524628 
X-CRM114-Status: UNSURE (   6.36  )
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

Hi Andi,

Sorry to ask again: could you consider this patch for i2c/i2c-next,
so it can land into v7.4 which is coming soon ?

It carries Carlos Song's Acked-by and Frank Li's Reviewed-by.
It still applies cleanly on your current i2c/i2c-next.
  https://patchwork.ozlabs.org/project/linux-i2c/patch/20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr/
which I checked few minutes ago.

Haobin Jiang's
  "i2c: imx: honour I2C_M_IGNORE_NAK"
v3 is based on it, and waiting for it:
  https://lore.kernel.org/linux-i2c/tencent_342A87BFCECA70C9982E68A79AAD878B6909@qq.com/

If you prefer a v3 rebased on i2c/i2c-next with both tags, I can send
it too.

Best regards,
  Vincent

