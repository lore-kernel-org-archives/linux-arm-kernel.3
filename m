Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB90CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxZ/iMk0sFlFcogYti23NV41Ls4gRV33Q62yrcsixBo=; b=rgB30+zMyscCKBMqckoIx8jWhl
	C37QvnyvE7dHo5WaNtLQCBrhG0WBRIqpeb9tsb4irDxthV0/5cmDSGcrIhc3V076BHNjATUVN2/oR
	2+LYYcGNdpHIDrRLjwvkBzvUoC74/IiZi+xX+Ip8eV9NmohoWBf/MVKrzbcCZpVj2TCTUdJrJXdO0
	1Eh1oYoKfyQB4UEKm+J0PNlkTw7lCVtsZFuyg3VomEMDQVaDbqKhJSsqjbXjeejmynRCbdLX+9qq9
	1UtXrfXqIL1AFRCUSL3GFhkOCDp2rbW/dKWNm74Zt+y+X/F3pJaFI+ajbD35L0uPKCKbYfVI8XAiA
	kHbabMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWx-0000000EUWX-3HLV;
	Mon, 13 Oct 2025 20:52:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWu-0000000EURc-2pAX
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 20:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LxZ/iMk0sFlFcogYti23NV41Ls4gRV33Q62yrcsixBo=; b=pWD5MaY7r5NYbgxTH67cVrFmpe
	x3uSK3+x3ZjHXxa9ehQIbgUMYT3RixWXQKnOCmN0U7wb51Dgkzq1NutQpyk4yenLDNMk9iRtK9h7q
	x0kdUxKntho2bigukBpVtpDilRjE7gOCgE/8vhUnmK3XS3zp4Tl3HOXz9EFKmxr1bygGWPNpopTOs
	fdceJJr8aTuoU/jE2jgyBw0oGPXrd4/IY6h287ikGCbNC3hHyv5rELYBIvJjJG41/MPgPUIcFZVQ0
	Yeu2AwiYwsm2vN1CvFsg7gIY0d+OuH9XMjh/YArtw/YuLTKyVCMm5Q3Xah2ceoPjlLTxuoeyLs92T
	4m2q+iYw==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWq-00000004d6x-3tIs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:52:27 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so6544954a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760388740; x=1760993540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxZ/iMk0sFlFcogYti23NV41Ls4gRV33Q62yrcsixBo=;
        b=XlJnWXoz0hEQY227IlFaD3liC+Aa+EbjpaHilPif3MsYbQSBtIlTXghDC6OzWAjF/f
         BXhrF4DNKapa5O4u8YoPGCAW+gSnFtCkdHK6OUleYt6dw/iCR9z0gbzTxhB7nZPe6KLW
         Jyp5VGoIBzzacmXEdw22uYyCdc9iE1RhorvtKuNQmmgFxpg/2ubTixObSSgw1Arhflxx
         YqekKmlPKeraXl7Nxxox9dybUW4YdFXK9/3+Ux5mQjos+YRkkJ+qPLn4+OX8tFlmhz8r
         h78qWVVCIv/jXb8xQnKL8XXBitbO7+wmtZWXLoJpH3wOQKdYCU3pwmgj1JVLiWSzoaIU
         J7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388740; x=1760993540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxZ/iMk0sFlFcogYti23NV41Ls4gRV33Q62yrcsixBo=;
        b=Gvxq4CSUmu3LaRD3sFPhvTAVvxSWfmw18HkcnuF8arEOnevI792VujQn9RyqHTDl6b
         E1Bfl0GIbO0vGi5WCL2j7HUHzTWPzl23TfSs9pyGxErkJKeccXPazeBgHxQzk9IrMdqq
         AzM1PTBSEmb8MeUDdUiIbh2LVGmVN3nSLSyjVy6lJf3alF6jYIQsFm/L1F13S9dzBCLM
         EGLULHOxFGHZg7ykSKoH4Ws8QtYFhFxyh7gNTavoP8tS+rrclcHRCEwVIiO5ob0VFDn+
         mb/pOFkPwONOwv8ivIw1Mf0Y/MAHA/J7utbvLwMBUKbnTUfYyRpnvRjn/fYK3h4Tu8xj
         bmdw==
X-Forwarded-Encrypted: i=1; AJvYcCUIjpCQeGweBAjAAq6dFrdQYLJscJuq9NCwM+I5GGJ+WtThglSr4+FKUwgeRTJhnWd6w9Ih0i3JqD/NoKlA0RCy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9vq2mpkrmJWp0OgNCuW2RmHlMBPIBGI7NfcdRW1+TA/fo/O16
	L96lhlTmWBYawoZk0iN2gLH5sUBNROO9NYPvPLxV4CB/mgYXAcZc23Rk
X-Gm-Gg: ASbGncupEf8M+FyoYQLX5DtU7LMj0vnevsF9qLA9tQlgJqSh3enjGDuOw+7imvwr5YM
	3gzV8mVVzKMpokl9OyIVHpS0yjixfd007XReEqQWeEG1mmjn/mqaPl9uXa+MIdq7TgUJ9hYCY0o
	6AN670tzWiheFvQF6y2o7/Z7Qk8un2jWqt1klefrEgpEzm+i3FkJZQYH1rzpaHKC/OGaNeDfVZX
	fc1hm9zpD524XPGZJFBKbBscIQavnwE5RKC07qpzJj+bR8IfCXblqM5BwOhFK9fZpizo8AzJPRG
	6QgCAutRWczQs6hvPLZKy2Ebbsl8XSeLomklKtaAyrsF9FudWttvyr0GiDYnqqmYvMpvR/N4g++
	YHnYDczU6PrZhvfMNxFmOxy0SU1+jBlPNP9H6xR6z4VhG38Gd/xMXVWM=
X-Google-Smtp-Source: AGHT+IGoPwwLuuZSmqvJkvje9JpdAVuLDDPRbWWI2juN47Cw6JrjLQfw15al6qeoEvpbB9EAopUh4w==
X-Received: by 2002:a17:90b:4ac7:b0:32e:e150:8937 with SMTP id 98e67ed59e1d1-33b510f8f23mr35543703a91.6.1760388740438;
        Mon, 13 Oct 2025 13:52:20 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cc82:37a1:ecfc:e51c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61acc413sm13445147a91.20.2025.10.13.13.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:52:20 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marex@denx.de,
	stefan@agner.ch,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH RESEND v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Mon, 13 Oct 2025 17:51:54 -0300
Message-Id: <20251013205155.1187947-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013205155.1187947-1-festevam@gmail.com>
References: <20251013205155.1187947-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_215225_332256_650963FC 
X-CRM114-Status: UNSURE (   9.72  )
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

mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:

compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";

This causes dt-schema warnings as the current binding only
allow 'fsl,imx6sx-lcdif' as fallback.

['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long

The imx6sx-lcdif programming model has more advanced features, such
as overlay plane and the CRC32 support than the imx28-lcdif IP.

Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
fsl,imx28-lcdif fallback:

compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This helps keeping DT compatibility as well as using the more advanced
lcdif features found on imx6sl and imx6sll.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index ce31b873fb95..d665f3241e97 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -23,14 +23,18 @@ properties:
           - fsl,imx93-lcdif
       - items:
           - enum:
-              - fsl,imx6sl-lcdif
-              - fsl,imx6sll-lcdif
               - fsl,imx6ul-lcdif
               - fsl,imx7d-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sl-lcdif
+              - fsl,imx6sll-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
       - items:
           - enum:
               - fsl,imx6sx-lcdif
-- 
2.34.1


