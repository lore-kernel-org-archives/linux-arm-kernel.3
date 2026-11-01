Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41B1606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IVVN8m67;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Qjst9gqP;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=U3AlGv5f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3F4yLJMM8zWZehfZmlGS7hVfGWhthzx9CVcnyurz444=; b=IVVN8m67J1waq7
	HwffHasbIZCkV8XVHeNJVNAXrXKSd3Gb8oNOWHZQvO2HLWzw8pOBKywfQPJ6TtkWGuQUwRJ0e9Xy5
	xvZuYqgkBLkCRVepUmo32Sfwyt6w0eEHRv4RxfVaD6CmrOC01ppfA7SyHRJ5l+23GaxmWGmX3Jr5h
	Mfe/asK60iVOt91bt6gYDvuqeb+F9zkdix6yAXj4pL0GzNAz2+joLkGCDKGJBcp0zmNYuJIjImEWB
	p72digNPf1vkfgds0JkoRxlVQXF/tzlO7H2Ktlshk1fQmx4oRjFhw/UtjwUg9YwC7F9xwLlGYODj0
	gjnrMnOocWCZwYPn7DVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexG-0000000FDpG-1Fwa;
	Sun, 01 Nov 2026 23:27:14 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.0])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexD-0000000FDmN-1KKr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:13 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575631;
	 b=ywqjXqE2Nkqq8mVVUK1QHcM2xeZVRw8UY46XdRnltcFD95BYhkA+gqx1DHd3e2mioE26tKP55Z
	  t4iXvDhbegg/Ruxn6WjOzT9BE8eC4P3HMXHgTqXwNY74I0cEhoclVO96yv8KajmhFO4fSIzek3
	  LUvW8+KxfpS9PA1VPbwFPDRfMwGKkQXnMzqEzyElYRt1DcXC/EDHlP1vWoWR4aocfiiALBrVjU
	  OmOAjgDtRAWTXdq8lQwilAOPD3TmORzR8B9yVXXuYwf5TQn0TKT7dX+7aWsDJ4KIUJaAEGMH/t
	  8DUzHz011g+incTsv9QSxO8kjUUu0Ba8IyIOY5XMKnXqJg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575631;
	bh=dMD7NNt02fBQRek8/xXDOk+vJjzCgMQuq+ey9x3Bmao=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=0TF0i/WO0fLyprNyF4VE7p//ewbIaqGPChpY1VWkhRbaPZv7WtHD+NjPLF8PC8UQWoErNKdq1w
	  FWohvS9+Amz64EnZOB4sfucUhrlDsUq+KakM3MasPoGVmPK0VNYBTdmRCY5lMWA29EgZ68l/Wu
	  iuU7ds62YvPfkOysoc7pO+6MOdmDJJ52NLd7YOYUwvvfAZVRS+M64wR7xaf6dDJwx6RwFu9QtX
	  +uGhKiQ/gEH9VKdbvcYBgWNjjdzZgDPIJFPvPCAFDyR4uZalz1WU0TfJGEHrBRDdrNOgP9FVn/
	  bLfSB1gbo00QV+aiU6oYPX44Dcv8RXlMRL6ILk4a6Iwg9A==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=3F4yLJMM8zWZehfZmlGS7hVfGWhthzx9CVcnyurz444=; b=Qjst9gqPTuo1dY8SrwEe/nzcyr
	cjn50fqGHPRkDGlgAdE61Q5zDtv+BLQ4aFP6KSrNkQU2sesFKe+CRBsf9HZWWQGIIdxxBqhfKWqWh
	JP2GUC/mEdQvnLMhsWpLv0TMSGnl/Uc65QOgWy0DX4UOkkvM5BXbrf8KrxPJbmPBXKAM=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex8-00000007AeI-2Vqh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=3F4yLJMM8zWZehfZmlGS7hVfGWhthzx9CVcnyurz444=; b=U3AlGv5f7jpjjD2BY3+3SenGka
	aZcHzGJUEB/6uzJVdIySOxtsqtBRQUnGiR5Nuqx1O8UMjJA+RIK4hW6ukmSPKT5rIWRcknLHZGBOk
	VX34+LAuIlqtV6PTMmuZglnARaX9HTV/ttzq5Fl9ijBzKsSNfNaCovfeVyIcBV9L3Z8Q=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNewx-000000002I5-2bco;
	Sun, 01 Nov 2026 23:26:55 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:39 +0100
Subject: [PATCH RFC v2 02/11] remoteproc: virtio: replace commas with
 semicolons
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-2-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Francesco Valla <francesco@valla.it>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=francesco@valla.it;
 h=from:subject:message-id; bh=dMD7NNt02fBQRek8/xXDOk+vJjzCgMQuq+ey9x3Bmao=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+05E6l1Z8uX6dx5LLHbO+76uzilnM7J/bBedM+ub
 VP3FlV+6yhlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmcvgvw18pRW8uvYidOloB
 OcxSTsH+W2Y1Gi+/HqlWG6j+7fmW8lOMDD/62pZZmx9ccO1E/v/T23pr3P/V7ROLvvpMsHO2VLA
 JPzMA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 776c252e9b33c74539cbbf4c3bf50fb8
X-AntiAbuse: ID - 776c252e9b33c74539cbbf4c3bf50fb8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNex8-00000007AeI-2Vqh-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_152711_460769_7E66FF83 
X-CRM114-Status: UNSURE (   8.99  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While not technically wrong, the comma at the end of an assignment
directive can lead to nasty bugs. Just replace the two occurrences with
semicolons.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index a86c9a949e4c..29a3a4c18097 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -443,8 +443,8 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	if (!vdev)
 		return -ENOMEM;
 
-	vdev->id.device	= id,
-	vdev->config = &rproc_virtio_config_ops,
+	vdev->id.device = id;
+	vdev->config = &rproc_virtio_config_ops;
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
 

-- 
2.56.0


