Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6943B105A58B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRKwlNptv66mBAar+PaEyJl/1lwLb25U/oESD7/00jc=; b=ORtGU97t7w6CobG7PONf7/uzBz
	S+f9SzX/fuXYCk+Z7hln3Gi+fMiR3JhcT5gaB15l9+Tr4/KGFHyMC9kxi1Rawl1Zub5nCZMa8ZXpW
	Xu2aFjNIyC0lbVJrgFpIeA+ke76GnkoRBICa5viRBRl8Zii7VC0swWC6T02SjpgJJ5Xt1zNl8FGnc
	MFSCnucWaLFvgjU9wUJpl/OAPlOsda8cl4mEijDvahTfspI8Uq/nEwQv6UgKLpw9YyFBBaHDnLMBC
	PEkXzVSK+vGe571vugo6a3c9buViWqLHTnV1dq0/7u1UYuo1vw0MnOKGqOVHBpD83bv0QX9LnBKPy
	njUCaMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eIH-0000000Dx92-1XEV;
	Thu, 12 Mar 2026 11:33:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eIE-0000000Dx6I-1sVp;
	Thu, 12 Mar 2026 11:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KRKwlNptv66mBAar+PaEyJl/1lwLb25U/oESD7/00jc=; b=oEsBHpExkrx9SqlZr7UDSRUjWi
	SxUCXrly7JVjlllCrAduDpT6oZr4OEVjYXNUEQSkKzh+Lq5W2tpG9uza5ySS0LmfaIkp8a2kSs9Y0
	GXuoiS/ykSLZ3pkFWdJRFmuqvueWcTJ1G/USQYqFPgm+9Qq0/tnrPSdlSpe6dWfWbYttLvEAONS79
	CAISRT0b2iDwF6XZD/m2zsM6Tuy6cC6BHZdcpqAlEfCtjSZ/Zcvx8Y11DOAL5uUGkhYDaLHNrTygq
	z5dY/r75+X29EsSJXjyNsYkp3CpPbeFnKR5nYwNhJM3Ps5e33jn0TuDMElXU+VEL6LQ0os0B9LGD3
	NL7Z+THg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eI9-000000011UL-3MQB;
	Thu, 12 Mar 2026 11:33:28 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62CBUfGvA2456775, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773315041; bh=KRKwlNptv66mBAar+PaEyJl/1lwLb25U/oESD7/00jc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=ZzCWWUzaat8+qCWpQYlggnzePtw/1QRuJvQqglXvbmM0Y3KTAP1LJWPtxiQfnykJ8
	 CMDso3rp27Gunl8FG/ZeC7a3CVc0YkhFaIODTKF1G71J14RNdGCCbwCA20nyNlUFfE
	 Oyotk5Vcl6p2bSG4/8Gt3hJwm50bbGhZwRdbiyak8EMg+cpH/It0P5wsgN9imw6MYk
	 Gg/8ndAR3/XiuiOkfuEaOXLzyn4wxYcs2KIGdKc3leLxNNwlMsa8OhfOwbTfrhpBvf
	 tDf34H9WcPbJ9mIKQzc1kTi0zk3L20v02Sdw2VbUbxbA0911tXacvT+M38HGAPkyMb
	 K7rxwXP3miTKQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62CBUfGvA2456775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 19:30:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 12 Mar 2026 19:30:41 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Mar 2026 19:30:41 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v3 3/7] dt-bindings: pinctrl: realtek: Improve 'realtek,duty-cycle' description
Date: Thu, 12 Mar 2026 19:30:36 +0800
Message-ID: <20260312113040.68189-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260312113040.68189-1-eleanor.lin@realtek.com>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_113326_891817_6AB972A0 
X-CRM114-Status: GOOD (  10.24  )
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

The previous description was misleading because this hardware block is not
a PWM generator. It does not generate a signal with a specific frequency
and duty ratio.

Instead, it provides a fixed nanosecond-level adjustment to the rising/
falling edges of an existing signal.

The property name is kept as 'realtek,duty-cycle' rather than being
renamed to strictly preserve Device Tree ABI backward compatibility.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:
- Reverted property name change.
---
 .../bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml         | 7 +++++--
 .../bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml         | 7 +++++--
 .../bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml         | 7 +++++--
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
index 90bd49d87d2e..2a640e495cc7 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
@@ -135,8 +135,11 @@ patternProperties:
 
       realtek,duty-cycle:
         description: |
-          An integer describing the level to adjust output duty cycle, controlling
-          the proportion of positive and negative waveforms in nanoseconds.
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
           Valid arguments are described as below:
           0: 0ns
           2: + 0.25ns
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
index b6211c8544ca..2136546adec8 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
@@ -134,8 +134,11 @@ patternProperties:
 
       realtek,duty-cycle:
         description: |
-          An integer describing the level to adjust output duty cycle, controlling
-          the proportion of positive and negative waveforms in nanoseconds.
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
           Valid arguments are described as below:
           0: 0ns
           2: + 0.25ns
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
index e88bc649cc73..e8ea1362b16d 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
@@ -133,8 +133,11 @@ patternProperties:
 
       realtek,duty-cycle:
         description: |
-          An integer describing the level to adjust output duty cycle, controlling
-          the proportion of positive and negative waveforms in nanoseconds.
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
           Valid arguments are described as below:
           0: 0ns
           2: + 0.25ns
-- 
2.34.1


