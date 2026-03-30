Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BC0F3D61F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=; b=FCdPxOkC8bzdshAos/ZKzWog9r
	nsOGuAmRogRmwW+66wGTUwK8xx2Tfb4PsDDg9fIEUQw2VGMHRYHzZ4+ss+x3N/ERtSQbr5xmPdDi+
	Smydb3XlANhElCcE+YChOgQxNj0XZj0foJjXA7xxH5v69dnp9bAN9cJDINz2V8h0mnqnE8RkwIQBn
	JGDUhQdpk6UI/Do9YRCPpBa5Hv+f/MU3PSunW0povTQmqDyEhGjifV/oFTd97cvURoqzZoyBO2MPe
	GMg4RFVSncnS0Gd1DmWYfX5SEZRbW0zyHVaNkRV01+MvYsXxt/IR/05yWt5lG/YSQ9iLzhtofbZTP
	J37ZsOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785g-0000000ArnY-0deQ;
	Mon, 30 Mar 2026 08:35:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785b-0000000Arly-3aaF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 08:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=; b=dmpc417rgZ+LkRmHf/nAXb/eqL
	wE/itfCEfwBupAyUm+/e2PojYtSfs1XpbhRbW+n+BEGE+oj6FV+2aCJIFTWldEnrcuXMilpqSyY43
	CxyMUE5SVkpcRS7pcErWBG//scQFNiagyhWLQuu71zRDlQ76Wad57Chg8jUhFL7UPIBQ6lk4lvbci
	SF8gurIYNGGrCmmkGW8Om4P+31QqL7GtMngFiNTCA87wWKlYUq7aVtsUzgFSqElxeutwuLszXevcW
	uGDHF9F+tfPRUvitK9GYlz3fN4W/EcmwOQcsEHrC62Xu7UelhvG8Hj7h1Ybyau8Q6gqtE+QFVheqW
	FXuORy3A==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785X-0000000DKJT-0lKp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:35:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso35471295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 01:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859709; x=1775464509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=mfAR9Nd+GcVlNaO0+AEaGq9PL1SnUp9UqBkgXdc8Wi0OV+2oUliQh7YcVxzTJkDR80
         6kznaIL3Rtfe+//GkvMnQM8zrqAs5DJN84o0NlmjWXB1R93g5QAGzuimpULE9/NIdrew
         FURQmO+xCxgH3/M2P3ifjsBJZpGCzTbVP5WkPzCgXDjWu0bBy66z5yCXOODxBsa4Xc+n
         NzHpTo282W9Yp452z+WqOZiSuMKtnc/wje7DDINpRjU/hGauCuPUwjspIhI5X4EFx9FB
         xSuU0zAr2//WLTC4glIMzefGF+Dm/noktyOP0OLw+egzye973W2eq3QE7AAgDTl/DV56
         h9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859709; x=1775464509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vndNgbOdyTJpKLwuHM5pad07Ye98EZiTxW8ph85Wc58=;
        b=ACR5XrtLZb88GfVXZ9p73UNyjxQLbklxAzPnfjPhTkkRCXSf/cgkz6gRw5E7R+UnfK
         M720+UT3ny8VNB/pkTea07aX8HFCACU1mYNDGEXrN5xXDBBb3Sk73LLeDqj35RKhNGPe
         lXgHTVXodNDy/MQE6+Rh9KUbFeJZtGIpYLzfBV1guDBUhp1zS1glMfI7k13CFG5pwpXf
         Ii9Hjl2TlZaYlLrmPeJVRbVwA7PPbrjMzecnUwWELCD/jBJpxAWtn0UTnGfXRjVaPc+z
         UNTfwossKWG3dV1SncOQKPuW8pCulyn/ePTHWj0PVNqIZJMr9SjCNQ2BF4e+AIvbnHs7
         goUA==
X-Forwarded-Encrypted: i=1; AJvYcCVTWPCH/x5FNNQiF0jNgk4bHjGYOpht6U4m8Avi86DSle4ZoPLu7XerlnvqOP26Ov14JIMOH6qpv/yTEKUJSro/@lists.infradead.org
X-Gm-Message-State: AOJu0YzA7LOJvte22P1WTpG9A4GC/mBNkj3S98Qv/2ZTzwbebULLIJ8v
	pTnyBTEAhQIfie2n0LeIsOufXWWY5GSAyu2TKn4NmSu4FeOTmCYJ6gZT
X-Gm-Gg: ATEYQzzfjsFt1jvLVAMeIr2ZYxUOipEcaHmqGXTISXIJTG3RYvPM/vbr6LzKT/ku+Ve
	vSn8OeexKnQFvVy0V2wgDzWgLMr+5ePUX8DvgbB72WV1w5nSkypEK2zgcEsQy2Pn6iN33zHjJul
	+i2ngR1AP6cu8bjcbL+PsyzZQsP6xLMD+hUPNXSd4H8WULAzyOMVblqxI2nO5BktTdHCTNOJmuG
	BdAnKoWJglfhb56LF0VxZQLJINkOfbvTgyDveIUdfLrJJ0LSH/YmRa+6SO/j6uoLnLM7RvSWf5m
	4aJjM21WEDtNtlQ5DSux5xgfvoVKVaL+ikBOus+toaTFWVDL7313Qg5+Ot3XCJR8T3LWXD5V/up
	VRdTlKh1QKFSOkVXOlQ2w/juycz1ckzbdiCLYtzWCNyCmefyYFXzmkznQWSZRiGEfaj8VamMaNv
	n8BmaLk+qRByeftF2oDgA=
X-Received: by 2002:a05:600c:a10a:b0:486:fbc8:8dfd with SMTP id 5b1f17b1804b1-48727f80089mr170085445e9.23.1774859709303;
        Mon, 30 Mar 2026 01:35:09 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:35:08 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Mon, 30 Mar 2026 09:29:36 +0100
Message-ID: <20260330083429.359819-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_093512_428715_8E54E0B0 
X-CRM114-Status: GOOD (  10.78  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index b95435bd6a9b..2d3c4161a7f8 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -30,6 +30,7 @@ properties:
       - mediatek,mt6357-keys
       - mediatek,mt6358-keys
       - mediatek,mt6359-keys
+      - mediatek,mt6392-keys
       - mediatek,mt6397-keys
 
   power-off-time-sec: true
-- 
2.43.0


