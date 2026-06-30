Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2127C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=; b=vywmN/mIxnVTw6gDswLrtzYjTy
	g/drthep9Sfj9hcCNe/yPrJwXR086f2HlUlef5sQ3MvKehl3GvB5WPj/IRg3eod/+P1mq7qtOr+NE
	gNda8JF7belSEUIeXSA6pQo8zO7PT+PbRcVD9LeJftnwzLJvqHRSihLEhDbAtYW61TPBBTS1zXMP9
	wy5oOVnVZ7SqDXJSrNBPAvOJOe8lKLoc6QpPjhGd1DTYig8RCKTRHMFWJmXnWfbElwh3g/xLt1OLZ
	ckcQJPiE/DssSyplMPx+5Y8t9ZBenJuXklZApbrqVTuRJT1agSEOR0CWIjO74owviqFKbuWomx1kn
	pWr93yCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUkB-0000000GPmp-3dvs;
	Tue, 30 Jun 2026 09:27:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUk3-0000000GPco-20dW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=; b=oWLKY+KzH3eTvvN0q9t/C5Quuy
	+9ajDGpO2xW81j3UW+qjC9qld80QeDgRJLzKdRtthA24iyavRRRJycTISa/0TP62Ba74i1UVp2pOu
	YxaE4OuDdCo+nCQ4FR+Vq27UbC0Hz9RmatbNICnyUa7UrlzsepzD/WmjNIlDPKPL+IKdXIcoNPCcx
	t+yMnb2j7aIKixQkCCGBJPIVdM7zCKif7gGJHCcAplHj17kGQjWbVr5lRurrq5Q1OOKs8aQRU+4aQ
	6REihkWyccjOxnipiwvM3akvf85/e5LyYg5K3obtoqvU325xqTMsW85VR6OCMdzr6iGILwDHtzOZ8
	4lWnoROQ==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weUjr-00000001hvp-2r44
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:26:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4758bd3731bso327043f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811602; x=1783416402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=Rn6KxuzW92PvokfUEwbCE1lTkiznXuBhoJLyOEm7h4A50J4+4wO5p8tvqhKWyOg4+r
         W32g8PnzTukvQXKcDLpOdzsMi586egN3ot3i8GLPKpQoblkssxNskMsWnRKTEhRvDcpr
         JrdPOQlGie6oFN4gLrkryFPI3cU3avvqv52A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811602; x=1783416402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=EdTkCxMIdiNHRLLW9euk5Di0IrsRqATVFSiN3LOvAbRs/NGifsHjXLMuKWIZg/hh2q
         5evDVzjdP3AhC3nJ6xu61R27OPDawK7w/27/Hpqto+gFMP+fXlAzRpkB6CQKOollJbOb
         oY1y+ZJVyqUa0Q6odo4ivrlGV3qor4/UejuZzcRO4SwJU86j43Mvljbx6bl+DIih0lbi
         Id837bEwGfzFrt3OuA2epP0ozmmR8t3V4rxh54lP6zxvLz6o0j1jR8gzCBT88Rsee5MH
         u7I/WElAUTjbusCgF+1JzHEYNtc6wVQcxBxg5nPRZ6vkLV3Z/EvybgGl3IQvNqm2GkHk
         Tn5A==
X-Forwarded-Encrypted: i=1; AHgh+RrMra2cv1gmcPye3NLu2eGUmieEwqr5ajXTijiszxz1z+p1bhQTaJrLAEO5H/XlANt/Oi2wopStuewBgGmlaOAt@lists.infradead.org
X-Gm-Message-State: AOJu0YzmD0Yg1xBf6O2Dv+Bz1DesUX+626JRI5Q7tMHVLb4i98N+Dehd
	HiEwxjEW+58EvLUTRDr7J2ev9ifn6nvCc8L+LcUBCmL3LYStNTMSKA2W6K7SQd78Rk4=
X-Gm-Gg: AfdE7cmnVAwC9Fp32FMjWqPToN/cLNtnuHfu+xPkqX9QiEmGEjOh4oYcQikCzxxL1zq
	e3d2aWpQaHdAprwMTvmChv0cW4XheiP/ZlH8q/HuEK6CnX2V3KnvacfcgKPXIjatQAOah/Rzfec
	42nlS8hr56BOi5n6mLQodt5EOzM6w1u/wcvLrUX4dBHwMnn6EspqtQZOUrht/XaEQQupO8s4d7N
	+iqfJaTM1BNt7j1+ViSck15ppP7tfLYgFNUtZp0seMtN00CMA+QFEngJ+Yw1f3VpUAvIvpVRPMe
	6SO0Q5n+mEtfKPK8gAyO4hd8xOiaizAKJcn7AdLFyON2Ypz0x+QN+akrSytMGLutxc3eAUAvIej
	Ve0FaD4mxJgpfBpZ3mNvZ+D5Vs5DQDtLwDYd9uQ84WniBtHw68UjyJrX8Ql5W8XiSJF1jynCABA
	wl9POAEW8BPYXiwQAy+nnqEEsxShr2WM/R0vWHKUTXWsDET7P4YTsdq1NEe7BEMDRZY9JoiPCJ1
	JvwL52HEyM5ksgZuJaa/lH7vI0v2CQ3OwhjbHGNW4G88ER4CVeolrAThw27UN7iLij8YMDn+eGg
	N6enIP4bb9wZdA==
X-Received: by 2002:a05:6000:24ca:b0:475:f0c2:75af with SMTP id ffacd0b85a97d-475f7344337mr1343805f8f.26.1782811601977;
        Tue, 30 Jun 2026 02:26:41 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 03/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Tue, 30 Jun 2026 11:24:32 +0200
Message-ID: <20260630092628.1695560-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_102651_010458_26CA0596 
X-CRM114-Status: UNSURE (   9.93  )
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

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..ae36d703532c 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0


