Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203F1C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 22:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrCJwvq4FJRDCkfm44Ye55Kq5POR7NnqJpsxGpwWsOs=; b=xjbFe0pqyP3tZQQnqawJzEdrPt
	pg/kBGZ9BKEoG8VRR8vdueyDhprABYUfym7tGuYGaH7t+r8yYiFCbkjuLVforQI58qI+UIXSBnk+6
	zX1lVIcbuO/y6xHvbJWO40d4PvHgcfD5ahxkyqLJ0hFMz/hbj7K8DZVR3Na4is2GApRTBEU9jV+C2
	pt34sypIZX8aYTaFcDBCmYCJF1/9Qmu/NJHaS1iZk1naxYRnQRC+Hx+/VG6fbTnU8jH764bZP6tDY
	L0DLykBX1qCPPdSL9ptjnxP3h9pLmaUV6eKMwQZ0Kg2cg+30COjsj6x7VG0dHVZB1e5RNnHD5CuzI
	gPSF+Qfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Aup-0000000AcPG-1LqQ;
	Mon, 31 Aug 2026 22:55:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Aum-0000000AcOZ-2LlK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 22:55:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso1880105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 15:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788216943; x=1788821743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrCJwvq4FJRDCkfm44Ye55Kq5POR7NnqJpsxGpwWsOs=;
        b=ezvJJ0Fl0WD3n0f15L2TEQvnrAlSr14Rv6Vm2gp7R+kWxZMenEsbx7IM4RiAVKuZMy
         Q3ja6CbNdD93RbbI0CivQc3rIZ80HuvIrbWRPcqNhA2B2gPoyNnRNQg900Dnh0fetLS9
         CUVW0SEP7MMtnH8lPvAD59GcGWfF0oCRgjH3gdL0S/CHaciLWRERy80SLT+ER3UQnuWK
         Asf5Yzg6IR7Uelo+ViO+hGgILqosFXWyRJySJCqebAZ402sZoo6qBgxzckKq5UTBH5uk
         dfkYgrFQRl3cRTEz/DQrJj9YCiubfi2WV43hjBwM6sVCZOmlej+/F/r/L8hjeye4lsaT
         IRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788216943; x=1788821743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrCJwvq4FJRDCkfm44Ye55Kq5POR7NnqJpsxGpwWsOs=;
        b=UgaMeaM86Gzl9TfATl6qeEhsaGZx1oR9lgNt7zTuLwmiCb6hn4BSj782IN0y3YwIWd
         E05rR2zJAzZui3QSydxlrgghKMlkaOYVMWIRhK+ICaRUM0jj4HuXFSsQ4zddp6jKbt5y
         szsHPAXore872EXOc9hvT5L9QAq3RBnZRWHlhofkkY1YcEuAht5LzI0ZAk9yQ0kTzhov
         F/WsUChWuBzQEVYsJ80TPceUz1HZQD02qZuERkeINSCWTGbDVOCLNa4mfizSkDONKOUM
         mlU22UzCHtidJ08nac2Rg9IDXrbQFV60704lODJQac1nIFG5ymOs15dmP8KSRDeoakRx
         AFsg==
X-Forwarded-Encrypted: i=1; AHgh+RqS4jLX6IxoXMm7vJ+lwT6tKjoPOBYAXvER2i2oTgcmqssYVytMq+t5GV5ZmHljtppnXhXpN5mGehJGnsZg8JM9@lists.infradead.org
X-Gm-Message-State: AFuF++lz7s4i+8sXwihU4Ccg+33kLXyOJ1Xm5VqcNXfWtQLjVHBSXkFz
	iWiDr3ng54X4s3iDH1x1CpJ924dEIE198LNRbqOA1gm0tlcCUVaf6DQAwkqQr43KVDeTJg==
X-Gm-Gg: AR+sD10CYuDlY+6KGCoIQJ2XFHhut3Z+fnH0sdyU502in2104bUD4cU3ux1pqukNlVE
	jDbbVGLRMr1TqHAia3Hv63DNR+4xs8JhRW+F7jdVujfITBqZnU+wbYiORl4q1aptDxkuTx5XCWV
	AtDrZkifFdSUV+5/vO95ynhPxt/8rr6io1mgAKM4EUDrdtN+W3F1j7ORUUxacNCcIy+aH/h83ai
	j14usmmwcjxkrJhU4nETdlbRPZyMmPw4j8Wgx0RR0D2RDXIjTH5Q09Rf5iUEqVfl8f5alwD98dt
	GxgmfSHafQoHLgGlpK9m1cmdZdcmB5ye2Sjl/56D+dsIH5/iXw1Y4l2cY/4m4EXrTii8ms3XK9T
	j/RPmtv+gIJWGLT7cf7Y4so8YPfupIQLgS34gempTcaDxXUzTfKI754nxL1nstu8Bi0j+d54JaO
	b/ymzeK6n1y4zOKcLp0I7KJbTPHqh0+UPe/0JwQlVf+WFHb6Hvy7zMMqUdTfEUXlPi7VVq45B87
	7hmue+wxttUKJsCyG4d7uHFnA==
X-Received: by 2002:a05:600c:1d15:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49b91c4338cmr399173455e9.10.1788216942522;
        Mon, 31 Aug 2026 15:55:42 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm24452615e9.4.2026.08.31.15.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:55:42 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Tue,  1 Sep 2026 00:55:18 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1788184274.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788184274.git.stefano.r@variscite.com>
References: <cover.1788184274.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_155544_640720_F0CE4818 
X-CRM114-Status: GOOD (  10.53  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for the Variscite VAR-SOM-MX7 SoM variants
used with the MX7CustomBoard carrier board.

Both the first and second hardware revisions are supported, including
eMMC and NAND configurations, with WM8731 variants available for the
first hardware revision.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v7->v8:
 - 

v6->v7:
 - 

v5->v6:
 - 

v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - Fixed commit message
 - Fixed spacing

 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..b732ff810265 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-emmc-mx7customboard
+                  - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                  - variscite,var-som-imx7d-nand-mx7customboard
+                  - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+              - const: variscite,var-som-imx7d
+              - const: fsl,imx7d
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                  - variscite,var-som-imx7d-v2-nand-mx7customboard
+              - const: variscite,var-som-imx7d-v2
+              - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3


