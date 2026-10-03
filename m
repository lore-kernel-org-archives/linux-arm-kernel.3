Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52DBCA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 19:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZ8jJNMTWXkD7Ie07zhV8nbM/XJJgkE75+/x/XRuIpk=; b=mkVNOxlp6lqzG31WN7rDLM0vag
	D+MD0bR0lf0q8SvB2CRd0L/hMxSOfhHo8oeq79BVRX9vC4KXEzUa4zUjrqcvPmp/u/inQOiOYvvcc
	yoRacabDVxDOpkDZGoLXFHbdLmYz0fhp5oBRoxVPwKYnKBmywC3A4U7Ssi3jIqsMXRuSURlhpuuuN
	LcXn16tGbAWTLL3tRqYJVYbnspZTRT0M+C12KbRSgE24CG/SkDtWSf0Tu43NUYYRtfWpMRQZFJfrd
	6uB+Y4qkXCWklUoARW8dJnOfOFbLdOZSPJCd5uwyCRsQ1rsfPGFCrZvDNx8EFoat6r1RpDAqj8z2o
	DRIj6tbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5h1-0000000DxyB-3XIQ;
	Sat, 03 Oct 2026 19:46:47 +0000
Received: from out203-205-221-245.mail.qq.com ([203.205.221.245])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5gw-0000000DxtX-10Jy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 19:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791056797; bh=CZ8jJNMTWXkD7Ie07zhV8nbM/XJJgkE75+/x/XRuIpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bVcxcNLiZCRu5EyvGzOTxw+IbJlo2lcPKIVEgLByy+xv3hIXGpt2bvCDLZIrajnZZ
	 p9sxMOzNobX3XkMnYnQvO+6q7nbxbHO4NrBaHDwgqFO16PL+g0XtQgYMOdSDesewmX
	 ycVHVFWnSTrpKf1aVNlTA6ry0rfODsgjeA2mKbkw=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id B9D93CB0; Sun, 04 Oct 2026 03:46:29 +0800
X-QQ-mid: xmsmtpt1791056794tn6zlrqep
Message-ID: <tencent_73544BE6EEA3044EC0C299F463FE82462A09@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUAarNY/SNUs9s0PWMFLrttcOMPIqeoUYIBG/86/282ChsllCvB0r
	 hJ+Nf2HBj50wqq65vEtalVhYbhlOBdW1veTYsRcB5k24yKpP9oaTxF/pLhbXdZRhMtdZBt6VDPOR
	 q624/24n1gAU0GKasvOx344v05RMQIMRcP8x7/jeFMQTWcRmqmGrdQFO56jxcC7RYP6xq31sEVFc
	 BVbIirT7RaAlD1qyawhafDDExBN3TeilxegGL4WX9TLL/Futs7fX0mCOEvskOQBLEwJmzaxtWTEk
	 LKYSi2Bz8e9nPXyUphCebtMFsUobL4RyC0neAMVW0zGxu2HTYh42xUQsfMiAmO7Lzt/wUuaKxU7B
	 HIF9Jks2abkXY4NWpNf5sGs5UlvkE5blsmOxNlu20DJhqZKsPDDKjUZp4vzs2cOdFsHgtlFlaQYN
	 QQXlQZSvmP6zn3KIwV2C5H8CIuIoEeN5THd5NqBL0ZlCsmWpgxA4LUoXpZT5X8xNur4nVbbQGjUa
	 7V40XT0ziI6HjFflf5DG9Kwf+K2qER3GGh1y2XOGNZXObswXmrrHir1+1VScdzt2ewHrEEmZMIfx
	 JdrxHKb+8dgCvoy7Qqrn6R5ruxdkt46r48F2AzmNktYGjJVnUt9IHl55ebUbdATeHNWHxM8eYy4v
	 Q8sKo6a01zOKlOofVPucHwWdOMVRvYnqARFj/RJp+TK+cBibYahZvN1jYPL9kdRcBAZh6TpBmVwI
	 J4rMDt5axGLeQ4fOf9L/UGOEXTRJPgn2TrqVzdhvgiy7J7tzW3zcUT9UW+xCo+w+aSzEJa4mP81a
	 Jy3N5hioiA0I3ovMpVZ/oHNnkkmGf7hwTBVKXlpK/QD/zWqSagPHQ8hYmQNFqIgbk/bXgfqiGjpr
	 QFYCgMZ80DCAcx5t47oqVuXJQ+SB4dTp+cCEG1gpPNrK0U+cEsGqF5USiiXnFdun8U0nESvOZDcE
	 Y6WSQdu4UY+QKBd0senfis6QaEWMRc1CXZvnsR6pF8zD513AhnbMddHOHWbBhfwRv2d6WumgO3e4
	 eyvki8TZapmPkfTfBR6swNd4bJrCWP/3dyx74xPQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: soc: xilinx: Add EBDEE EdgeBoard FZ3A
Date: Sun,  4 Oct 2026 03:46:24 +0800
X-OQ-MSGID: <20261003194625.936288-3-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003194625.936288-1-2254650260@qq.com>
References: <20261003194625.936288-1-2254650260@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_124642_578617_60FC2D58 
X-CRM114-Status: UNSURE (   8.43  )
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

Document the EBDEE EdgeBoard FZ3A compatible for the ZynqMP board.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df..ead3a3c34 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -46,6 +46,7 @@ properties:
 
       - items:
           - enum:
+              - ebdee,edgeboard-fz3a
               - xlnx,zynqmp-zc1751
           - const: xlnx,zynqmp
 
-- 
2.55.0


