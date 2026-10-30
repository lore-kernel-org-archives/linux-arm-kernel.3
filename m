Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735D0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rwxUQEyq;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rENntMUo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E8LUU8/dAjJYoBx2cnVq2geueGnckzaBaZnZ1Jie+PA=; b=rwxUQEyq8XwRQA
	b3OLZo0l75SYLUBgqHzPEtC1fugynZFs+TxKtH1y5j+UTQphO+W7Kv+zhOjMbh801BDyN5vvGSV4L
	CJDmcv637wFA3GZyfeunm21mgYC6PHseKN9Y3oltPyZfPu2hXkb0CvrMslgdDEgHUf41aF3MfAQqR
	YW+ubgb1YTVg0UTZkV74fgFWiSg6tszLo8ssm5sp+GBaSgEY2gzzyAA/6z3+xBbP6sEzuVZf0q/qQ
	EB/LIoWHFG+D2DtRYjHcb1ZIV0tY6WeZxWgNbzG104uegtH6wgmwVtte9MAesyFE4f8T2O+zPBXXj
	tTZkdGkK7SN/j+/2yiBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhzs-0000000B7ks-1QrL;
	Fri, 30 Oct 2026 08:30:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhzo-0000000B7iy-30U1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:29:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 61DB11A13BD;
	Fri, 30 Oct 2026 08:29:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 322AB603C2;
	Fri, 30 Oct 2026 08:29:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51D1F103286AD;
	Fri, 30 Oct 2026 09:29:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793348993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E8LUU8/dAjJYoBx2cnVq2geueGnckzaBaZnZ1Jie+PA=;
	b=rENntMUoZ3qOsQAg3It22RPHGFnouqYJz7QFfqZnoS2WiqPWuISOOfjeIG9Evj5WdcWOp3
	LxRmulCD1HUTCMNEMbPfE861LUmoF3od9bwlM5mrs46+x6RpWTAzk2lvoRp2yC8GnQi6PN
	CQLF0GS6hFar7uSXooTpAd2hBHjzeOCSSmkC2XSqip+XcSClJku2mh4eghjMTkPRy0ESRt
	4igCVvnurQMFLx5SWNKkiuvNfngHfSSvHT0Nc0VWdpH8cDK3WBEelbcAZWjpIUvw1IN3ZZ
	sUMrIsIeB/9M86Jetcp/dPwuaAaW72HdWljonF+Z0dPJ80cJmNO6v8FDHCXY7g==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 3/9] drm/bridge: fsl-ldb: Add support for i.MX94
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Ying Liu <victor.liu@nxp.com>, Frank Li <frank.li@oss.nxp.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261006-dcif-upstreaming-v10-3-bcfb28de0aae@oss.nxp.com>
References: <20261006-dcif-upstreaming-v10-0-bcfb28de0aae@oss.nxp.com>
 <20261006-dcif-upstreaming-v10-3-bcfb28de0aae@oss.nxp.com>
Date: Fri, 30 Oct 2026 09:29:39 +0100
Message-Id: <179334897995.680709.16225857559743446360.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_012956_926071_FCF93CDD 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 06 Oct 2026 12:21:58 +0000, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> i.MX94 series LDB controller shares the same LDB and LVDS control
> registers as i.MX8MP and i.MX93 but supports a higher maximum clock
> frequency.
> 
> Add a 'max_clk_khz' member to the fsl_ldb_devdata structure in order to
> be able to set different max frequencies for other platforms.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


