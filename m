Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2099C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H+QwI2FX;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=lPQTGAOg;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=LZBK1gbk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KWf41TzVYDqHL4pTFUus8pIHhKH/ijmasendTpwykTU=; b=H+QwI2FXpKjyw2
	ZhgStnrgiIoi02C04PZxWQHFkxZpuHoUTzmMPSw1jgivAJBY22oO5Y+6cYo3Ka2fesh2kBR3b+jDw
	fgUjz0sAsRNnCMPLXNig4aoRla8tfpXQeNZBYs4o7ROJAJ7bplmF8qSrafiyHREO6CgZigpppShjW
	goB8//2Sk+txQ8pl8ggrS5ZY0GGua/5189GrXs4czwDlOP04fsbJiDRdpe2zV7rn2+S+IJBQnYu02
	PHMERnIU/kp4EFuBifDAaVpSsxKX9PNwKN5Qev2dEwdB6SdKHoUAKIIdmyyCjLtjAiSpEuWOAUzPM
	2Qy1F/cY/+g3NBrOrkMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNf7w-0000000FFWt-2Qmw;
	Sun, 01 Nov 2026 23:38:16 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNf7u-0000000FFWJ-12LB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:38:15 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; s=arckey; t=1793576294;
	 b=WY7kBULu0+XNvhCduw6rjOlFUlyy1/M6xExtd5gJAkgRRXpr/un6/hZEijk1QbqtWPX+ixThNc
	  onUzgX0sK1qLj80XxM69MJ5J51wsUqusfVv9Gp82wYyHMlugJNcF88qWxZhNfnqx85x1TQfQo/
	  b6sGp2G1qcYNF5j56GjMBlkkiZDSTotnbIu/ggOc/ZJK8rolh+mIF73ca2t6HTASaENbw/5ow5
	  k8UxTxRv3zEvD8YNl1daKI1GQfX7K9rdSdXpQkeNDyqHwKyhnuAxNyunU6L9XJkiAd1yTagRoE
	  Xb4FDAdFbuuwCzV0A9b++KggtxBam88nEDY6/jdQ/K/9Kw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; s=arckey; t=1793576294;
	bh=W8xnIBvS7wOydEJdbm8IEFFIvhRv58/EitM/q4dFv+4=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=Cbs7FnQ1dpw/pBV2cdZJA+NBezeDbNfO29RDrb5SFh3nxqwm7PJ8zzxTachZEsTcDXkbwrKamZ
	  Rh7rgtyxNzNMkY60iGS1QN1FjhaKwfyCcRYiewNrPjhlfx4+k4516wrCK3PcgpSDw5BiNg3TrG
	  V7Y2rZ1ytoFTu/ikjjiH/yU3c2r6+40tBDAZyRw/QQdCBsNZTynmqk3ePSR/cC9F0oNDlNh2X+
	  ApIQIJ1nG9XpmGqEM/SsIj+zbmpdTyU4r3TJjSLh5Cu8NRqJEvidIckhzUkuX6voptWsPdFrkp
	  tUytn3lnJ/VeOdezHqYLEprG2jHmolTxFYmw+NRPCa9VvA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=KWf41TzVYDqHL4pTFUus8pIHhKH/ijmasendTpwykTU=; b=lPQTGAOgQvxpgANgqKk9aul6Zo
	xl404TRpUFBI7OuUK9J3d4rIjvYRNWyw1oSBm7gXj4FwNt6B3sXRrxCMK5sILzKB0iW/kRTu8DXKR
	OwHwonmBhr4uOlXMG2OFSBtYdcExbMHCgbo6o7eD2wvfWDAyeM4MyHqhnBHM3vWTjpj4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-0kln.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNf7r-00000007Co0-0geu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=KWf41TzVYDqHL4pTFUus8pIHhKH/ijmasendTpwykTU=; b=LZBK1gbkx1xKTU/yLEhk5AVcnx
	JZp/8TE38n9SCpNZy5oVP2C/OiqiXBfEDSVt5YspvCObs2UGDB+jWgKCJAjahy2HAXkBjUZ7k/zgJ
	TLP2Obf1xFhWwLUVaEwozxyl/n4PUdueBSTZkR3VYVMh6vmraNDp1+HZ22ZTy+1wkwdg=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex4-000000002I5-1jEm;
	Sun, 01 Nov 2026 23:27:02 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:47 +0100
Subject: [PATCH RFC v2 10/11] dt-bindings: remoteproc: imx-rproc: support
 virtio
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-10-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=francesco@valla.it;
 h=from:subject:message-id; bh=W8xnIBvS7wOydEJdbm8IEFFIvhRv58/EitM/q4dFv+4=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+35GL1ZfeoOluP6+64JCXXfWsylzcvLXc/97ab0v
 MsHOnds7ChlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmMn83I8Mc09lCMadyH+XN
 WrZeT3teRIfIkeehx+8H9+2aGLtJ9kIww/+6G/cMToYLN8Y4vg5M1lf+v8eYw2kiy6yQK8tn8O3
 2V+EGAA==
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
X-SGantispam-id: 071c0d066c66f6c2b4fb2995ab673a10
X-AntiAbuse: ID - 071c0d066c66f6c2b4fb2995ab673a10
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNf7r-00000007Co0-0geu-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_153814_376098_4AC0A3AC 
X-CRM114-Status: UNSURE (   6.69  )
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

Add support for virtio devices description for i.MX remoteproc devices.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..32fc415c7028 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -92,6 +92,7 @@ required:
   - compatible
 
 allOf:
+  - $ref: remoteproc-virtio.yaml#
   - if:
       properties:
         compatible:
@@ -118,7 +119,7 @@ allOf:
       properties:
         power-domains: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0


