Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E4760A2603
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eZmMxeaL;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gnTxbRqM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kNTRPGjk+JRlFS0l8T9G1tIUTUomkJSdQSP0R5ccDUE=; b=eZmMxeaLFBJNrZ
	LnF0YU+lfxiJ0EGo6QZO0nBsYeJ2QuzJhmhuy12+wbAUjAvJnPJbFHsGnMAhTeCOTCp5FDuEL6IpI
	FsxwmjmrfPdIJKt9HRb3MM2hkVulhdLfZzkD6p5NkBrwy/vDFUN3FCuqHo2LInFpHZX4NorGLbVdB
	+wQ4oNvbvwoGcKW74H1NjzR0biDnSPFrtFXL9xAcGGfkDfXeSkxN6NZDjuEMMprz0DYq0irhFR4Ss
	eTLqJPc0Ep8RbopRLYGdN5wGUVqtEgrf+iTlh5iORlB4OnFDKMw3np+ytdXuisiLikyLgqeGUqz6x
	lc2RwUPrA50JWR6G7xYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSVF-00000003JTv-0pVn;
	Mon, 26 Oct 2026 21:45:13 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSV8-00000003JRC-35cW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:45:08 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-3535a54bed9so5389007eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 14:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793051105; x=1793655905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNTRPGjk+JRlFS0l8T9G1tIUTUomkJSdQSP0R5ccDUE=;
        b=gnTxbRqMewzK5zsKI/Ugk4/vcH9K3I217x/P4HBuIzlldIHCQ9Odd71OMDnpW0mjMh
         I1aLTTLPzxoY/0kml3KCQEEL3+xICEr1x0eC4QXm/zWHhShDd3aDAgESZjHCx9RUQR6N
         dkgIxsqWMYWqwOouOQ7TGO3a2e0rh4hkB4pCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051105; x=1793655905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNTRPGjk+JRlFS0l8T9G1tIUTUomkJSdQSP0R5ccDUE=;
        b=j79X2tM1lO8WtrNalk+ww2tOZsRQmmKscO/6Z8QtGUUdORmC5aHFCFvRewQ7Q9fr5e
         hLLzCm6t+86ElMxtn7M6/8axIMnMWHntrPLdY0Uc0pmeJ/KOtwJoe3O42KyW8jVTdylG
         4QPA9pILdc8nqGfaG0L4NYKfXkN6nAE9yNr9lLoGJhrdwxSIQAMDCQeR+UgfvfJK17ce
         1IFaDW+0XqZcMowxzl24qKFq4k/kdo6OQ4RSSxmy+IvZmay11dLVqTVAUzKsSV5GePkg
         fpVRI4WaN+GXs6Oyog1LjfPGEtsboo8SMvGXxWUTkOCdfaZBk95rLZvwbQX1CYbtLG9S
         ZRuA==
X-Forwarded-Encrypted: i=1; AKwUvBwPEq/boTLiiC8v9DtSULi4xQ+JVQ1VQjQK2mGaJM2vdOgM2yCgvWzrV7bSoUy6DbPoOPEl+FD6g6vyVIUy2JK/@lists.infradead.org
X-Gm-Message-State: AFq9FYLh1MSluv57lshei0c7CjBrdG77gQviMpz9wGYZJ8SwQJeBCYPD
	xuSEwYCKxuPFXjfcETpkKyhbKpDP3JK5v+WMTNE/enHnzrpU5oGfsSp2LbvpcOOo1A==
X-Gm-Gg: AYBFou25eBCCSsskQ2fR0PEGktu9xxVUaqFnUc764QahKN+wYcWJCh25309YRUYJg/E
	/Llk8//gRQl+GHaHwSsV7/z7btwFYv2j/MmJNK9zTdEc27QJmHKx9jN2453r8MUs4YgDQk/2vJI
	IzQOci8ABR/nyRa0An+s4pdxe4i7lrPbCg3cjJo1XV3GVQD529G5mxHg5nd6A6EbtiZ4ld9Hnef
	ZxXWEQFSg2HmSXKW2GzU2vIwhqeKVTDLyPoaZRzQlc4r1ylkonaQh/wadHL50Eb+VCNa6Yuiej9
	oKVCSFmU8jjzPGfQSAIU4NsFtBdVvfMH01lQmsjO2gUh+GeHttMkEoarmQ/szGh+JHD3FWnAXjK
	kuxXhpSodqwcF9P4ySS7apPI/znNkyx55yToBqflnaNGQLzVyxQdCIxWqdhre44SShmzVh2vqun
	O5pDwW5BCnjZcLi1cBMFkEMA/lIMeber7//rqInmltZVKM9ntdHrGfcewwhcEub+kWLZOzUbjlN
	bOJb+UMvL0RA22rbSKAF5zlQbXaZH91W4x4igGU2v7Q5Ql99KsTgD4dgoeg/8QfZJXyBPIQQmUd
	9RCmJkd3li4i1I1FrWQ=
X-Received: by 2002:a05:7301:2295:b0:361:1dd6:531b with SMTP id 5a478bee46e88-369e84943damr11389869eec.26.1793051105135;
        Mon, 26 Oct 2026 14:45:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79c5:9cd3:db14:7468])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36a03bea5d4sm8375063eec.6.2026.10.26.14.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:45:04 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/9] arm64: dts: google: Add Laguna CPM mailbox array
Date: Mon, 26 Oct 2026 14:43:39 -0700
Message-ID: <20261026144346.1.Iaf8214205f496225013f482f6e0035e89ac624f2@changeid>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
References: <20261026214359.3122870-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_144506_787556_A38801B7 
X-CRM114-Status: GOOD (  12.37  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These are the request and response channels used for communicating with
the Central Power Manager (CPM) found on the Google Tensor SoC known as
Laguna.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Based on WIP bindings from:

  https://lore.kernel.org/all/20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid/
  [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings

which is part of this series:

  https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
  [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver

The binding is still under review, but I include this anyway to help
prove out a working solution. This patch should not be accepted until
the binding is settled.

 arch/arm64/boot/dts/google/lga.dtsi | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 3e670e524c4c..6ceb9ea6a100 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -365,6 +365,36 @@ soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		cpm_ap_ns_mba: mailbox-array@5240000 {
+			compatible = "google,lga-mailbox-array";
+			reg = <0x0 0x05240000 0x0 0x00010000>,
+			      <0x0 0x05250000 0x0 0x00010000>;
+			ranges = <0x0 0x0 0x05260000 0x00020000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cpm_ap_ns_req_mba: mailbox@0 {
+				reg = <0x00000 0x1000>;
+				interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,tx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+
+			cpm_ap_ns_resp_mba: mailbox@1000 {
+				reg = <0x01000 0x1000>;
+				interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,rx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+		};
+
 		gic: interrupt-controller@5880000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x05880000 0x0 0x10000>,
-- 
2.56.0.307.g5fe7bd680c-goog


