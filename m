Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B745C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=; b=4EN+Io2F+75DHn7g4mcqCNGbiC
	a68etYim1W1JRfNLGOmEEUvr5tr0LxXCTzrTdmH0Dwnk1WQonUwLxaG4lTk7c+HkdvAWH+1Yv+bL5
	w3dkeTUWr9tl4Xq33K3uhBCIxoGh4dgMl4QFhrZr/EgJUICSFtpwn6A4Pu7GgzF9JwrQNsV2nylts
	s4VdjJbKwoE1STNrSnPWzJCypOa+lV01f3dDkTGHec2B3iqMz2gBINLRsyHNvRAKT9vWl/2PiEIoR
	bic1Ibf10TlzJWkGHzieMiN2TPO0kaFhcUFVXP7lT1Plc34o+JTIOtudiOBhPh1EakHbyaWrX5UEf
	GDBTF+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHSE-00000002J8W-0haj;
	Mon, 27 Jul 2026 09:16:58 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHS1-00000002IzP-0M2S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:16:46 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84830c774a0so2403834b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143804; x=1785748604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=;
        b=fBKDMOY3/1AyR0NFtlmTUaBnpS6xTQWQoX73NfGroG2WRS7IG0dk8aF5nHy7KFqA2M
         W/yelXdLjrc6XS5K2cROORRCmNUVkUTG5AaEMG4B+ayad6UMFt4OHqQmZT2F7jEKUzHM
         JdYhBQdi6s+1o40HqCMzTOxOFXVKlhFSP3zCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143804; x=1785748604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=;
        b=sT2uMsO6xT+7+DkzMlwDES9CKgFQsFEhIpQ6Ptoj4Y6E2VkwsIe8GpfYJI0jCTG61z
         GukRlylY+bIMSgw3fWaqqlFQfw4cDGjrF6UMIH8y2I7KfK1NhUK7sjJXG6IpeAmqnzgy
         kjcGcgCZoBOdsKyTpWKd25tnVVPEts45eVd/vW/Mbqw9XgML3+borZlozKlMaJZxc4JQ
         M7pEemL6XNtli2ImBYv3ETwu0D+zPbaTV4ua1cNIp7F2G4tytBLeUIvMyFriN7zaZjTr
         uwFPFj1CrwroIZsviOffqHr3qKQ6fdKsuIYHu4Vc9dyKiKi05f2kUaTRvcnSB4vWaq2T
         ayyA==
X-Forwarded-Encrypted: i=1; AHgh+RqOo5QegVmwzrFaIJNZtD5ojC72J7f2YQjiSLMtaMvI0/nrShYK1MfAqtj9RNveVQE50v4qikb3Mwop2cNC3WEG@lists.infradead.org
X-Gm-Message-State: AOJu0YzAq/SRWEIvxQA1oJd7vJacn0ARpBrJiuRFUWWVS4g3FAS5NGpk
	+hubqQqH/f4lLZnAJLWCxf6Xzd4xyVAR8n/JssQhI+QPTX6qjoRvBbXX3AGVpLAp2w==
X-Gm-Gg: AR+sD13o23h/z+LTtCNQ2ZZzeQ+M/G2CTjmr1+qMQNnN5Qc2jC7qGJzIo7F5m7UchLe
	h5IiG1pR3ODMQ8ToUpmZGHAe/cJp7XPVtO3X9t23FWZM1omiPbXBBo8mkEvZ704GKnhKi8yYB5g
	4G4XHddJFTaHNac4dHijgTHzyXlSiP6K8mm3rseCO/Zn5H9hLqo+VMQR2iu8vsAI74kdsVHq8OL
	QPqp3Kx90hVGfLQLKlChTKTUTGKm0nRErCmN4lF+sCXPXwpf2a0YM8Z25qq9NBnkL6/p2on/6y8
	ObbdMEOCRkTmJIjBakpqf4zIN/4mxtU1vQUe7rH7IfNz4pqWsHIiXhz8t2B98RJ8oi2SSiC1H0w
	jRF9Y7i9gBoFEdgcHzF67iUeobXohdz6MuTcgJehpi3BnYZaqh7stqHAdc7VASlfG/fxlMyQvRY
	bkB7ogIk0RRyCTgL4LKNn4G1to7PUWrGF8DgteJ9Ir4VfIy7WKZeJQUYS9Kw==
X-Received: by 2002:a05:6a21:e081:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3c67da6f7dcmr7155408637.17.1785143804308;
        Mon, 27 Jul 2026 02:16:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v3 4/5] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Mon, 27 Jul 2026 17:15:53 +0800
Message-ID: <20260727091555.1023910-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_021645_124499_DC74BB79 
X-CRM114-Status: GOOD (  15.48  )
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

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..556e806b7787 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -505,7 +505,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.55.0.229.g6434b31f56-goog


