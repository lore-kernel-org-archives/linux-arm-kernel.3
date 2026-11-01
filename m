Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12815606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bPZ4d+u3;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=2OKnhjtj;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=I0lGjdE2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ArrI8itSWDzmfngH4qZZ7PdfHBBqv/lEEVzlHWiKfAM=; b=bPZ4d+u3LW9msW
	6vSdzubFQQEvNXd4bV4FyAqX4RnDAa8TueB8FpQZEWbCSOd+1M+JhpF2sixMGbuA4HOuKz7FhXDB3
	nUL7qhX9xuvtXkPLmUzyIjRa8tU3mek6BliRo2H/yIO067JA2claY2bTyAKYTuLxb4wv7339yKAEc
	ShWTqxWWemfIxif3zmZQ/a/bnh9WGlAB06nMxbKxjjCzXwkqoW8rCFfkQ1qC4zRpv1ezN4zq9SJSV
	jUxRm6X0aCep0z2oR4NlmWHkYNfscHtQIk4aRB7gMbtybU2g0OC/TlvPpSbSRcZlF/IqpOE2R+POA
	yaxw31HewLnYTWj5IQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexG-0000000FDox-0ir6;
	Sun, 01 Nov 2026 23:27:14 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexD-0000000FDmF-17gt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:12 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575631;
	 b=qH2Ri5n7SSRtfbDCp15/3LuYv4cfUcIYty3ZWCMy6FyzTePnkcnexxknuy0pk+hwlSUkx5b+ou
	  RzdzJm1LZQY/kTVeYQRgSDN75yI8vNygfdfqOuLpsoVP0aD2La0I0hEFq6l6BTMTgTuFaf+0t6
	  TMjFYf2csnph1miSK4aJe7+55IEnnFg2ZnP2YRvD4At80MA9t/mnyHvjYXkpmFbMMIpcgtlVZR
	  0IuSfJ8JkdBaWhmUIGJleT+CWFEimO6Rrnm6Q5N2usEBv+B7Hh4yjNqLWcIN2Xdo4S3hm59dkc
	  7ZAhDba+LJOU8ovEMnS7uaFJT0QfKycEmRf8etnOV9L2Vg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575631;
	bh=/v3QbkOJjm46JRezLWy98832CA7UTUXqY+qRLu2v8vg=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=WK80TOQEIskdhWXc+fCJISMvZbjGN3rJ6NrmCV1uYX9v/PzFgW8ZSXzo69v/YOw92ydegJ8GhT
	  lyyIAwncVAoanHcKYxNKvAZadVIi8tpz2BIUS8iW0EQ4Ne0jK0A0e1lLo6cYS4HiSOPTN+irNp
	  ptiA9wyH1eeiJi+MVWkAkJnABmiKL7JBuuI3qWmW7+HhiQ8yfWdDmVoLnl2dotrLDN3R+8DqHV
	  A1qYQQgMmXsnbiydwFxwlTvKou/jlm8oz7vBR9zCFHWJZggttYOKmi/Lkm0kftQLaf6qK95LwJ
	  Ri1wWWGBxvdX+a67fMq5rusbW+qaID2TnlfQdISkh85i+A==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=ArrI8itSWDzmfngH4qZZ7PdfHBBqv/lEEVzlHWiKfAM=; b=2OKnhjtjwvis1dF6KY7A0AnPHK
	xPI4VA70W+GyC7yXPacJJCU9utSLkZSMTiZ0vNQFEw/nE7xTdT4xCy20CKtF1jipDQdQ124Vsts+S
	0J+o4N4kNbNMNIeOJj2i7eqqD6IaZjtw88BcFC2o7CLXE+oZE/eJ5IVnSbveB8tCX64E=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex7-00000007AdY-1ehL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=ArrI8itSWDzmfngH4qZZ7PdfHBBqv/lEEVzlHWiKfAM=; b=I0lGjdE2pet3UPmDiBRzBCOLyP
	fSXPfjau6Xn4qBuJtzNqgTs391ybcqKBdqbWU8WSXmxkADJTRKc+lBScomsXiyaXcqgReQnq4tVt4
	VHSfPKivsc5rBGqftNsU3XbTF7ag4xl4Y/hQl4PG/zJ8FtAF0C2bWOGDF7FGHgPANbU4=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNeww-000000002I5-38to;
	Sun, 01 Nov 2026 23:26:54 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:38 +0100
Subject: [PATCH RFC v2 01/11] remoteproc: virtio: cleanup
 rproc_add_virtio_dev error path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-1-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076; i=francesco@valla.it;
 h=from:subject:message-id; bh=/v3QbkOJjm46JRezLWy98832CA7UTUXqY+qRLu2v8vg=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+2ele7L43Iy/N72xt83F3rbfsv19J67Mj7eS3htg
 4+Sc+PdjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAizEIMf8WuuTGqvk54FSBc
 dGbG2hQh78543+J3IhHh3mfbG57GvmZkOL0lufzB9Ycv8jV704OmN3vz1Ju9i8jYLsan38j9S72
 PDQA=
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
X-SGantispam-id: 8639f007e852ba699c70dc422fbeb9d6
X-AntiAbuse: ID - 8639f007e852ba699c70dc422fbeb9d6
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNex7-00000007AdY-1ehL-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_152711_460826_EBC1EE11 
X-CRM114-Status: GOOD (  10.63  )
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

There is no cleanup to perform in case an error occurs inside
rproc_add_virtio_dev, so remove the goto label and just return in such
cases.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 12f55a81cfa0..a86c9a949e4c 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -386,9 +386,8 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	int ret;
 
 	if (rproc->ops->kick == NULL) {
-		ret = -EINVAL;
 		dev_err(dev, ".kick method not defined for %s\n", rproc->name);
-		goto out;
+		return -EINVAL;
 	}
 
 	/* Try to find dedicated vdev buffer carveout */
@@ -404,7 +403,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 								 mem->of_resm_idx);
 			if (ret) {
 				dev_err(dev, "Can't associate reserved memory\n");
-				goto out;
+				return ret;
 			}
 		} else {
 			if (mem->va) {
@@ -422,7 +421,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 							   mem->len);
 			if (ret < 0) {
 				dev_err(dev, "Failed to associate buffer\n");
-				goto out;
+				return ret;
 			}
 		}
 	} else {
@@ -441,10 +440,9 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 
 	/* Allocate virtio device */
 	vdev = kzalloc_obj(*vdev);
-	if (!vdev) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!vdev)
+		return -ENOMEM;
+
 	vdev->id.device	= id,
 	vdev->config = &rproc_virtio_config_ops,
 	vdev->dev.parent = dev;
@@ -457,13 +455,12 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	if (ret) {
 		put_device(&vdev->dev);
 		dev_err(dev, "failed to register vdev: %d\n", ret);
-		goto out;
+		return ret;
 	}
 
 	dev_info(dev, "registered %s (type %d)\n", dev_name(&vdev->dev), id);
 
-out:
-	return ret;
+	return 0;
 }
 
 /**

-- 
2.56.0


