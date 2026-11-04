Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D0B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rRwjVOHF;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbYxSOtq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g2SUEvaP3SXotUZW0JgcqYRSFVg3QDyCA6RclhZ6jU8=; b=rRwjVOHF4pZOaD
	lh6RM/kqO8JrJ4f4nMlhW0WWnw+Y/tfgVC5hQ7mWFe3XqL3BIqidjWd5a439QKnCmTKkwNwODCxOj
	01+FA2kfz78C6k67jy9GAI1I0TLNzpvLyWZaxP2Rxg8feyJJwKM9RRSXNlxyWvLYH+oXJE+ZwRo1P
	z5xYUeAlx/TIiXosiAo0/7dxDDOIToBtm6j/YGnEg/gpWYzKFr0/AkftF+DJP2v41w1JJbisiTSBm
	yqwOJtSer5bRh3AguSahO7KcP3LJNeQq5gY5K/+Ky59kTnyStpuZTtvdeXSE5F/13uIhx2yK+kACm
	BR1PapS1nKwuYKr6cGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcKN-00000005ggd-2vWB;
	Wed, 04 Nov 2026 14:51:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcKM-00000005gfm-0M9R;
	Wed, 04 Nov 2026 14:51:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 66A5360D7C;
	Wed,  4 Nov 2026 14:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4F81F00A17;
	Wed,  4 Nov 2026 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803861;
	bh=g2SUEvaP3SXotUZW0JgcqYRSFVg3QDyCA6RclhZ6jU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mbYxSOtqacxogTJ1hQ5hI5ktbiOvRXFfAeh4wY+5fuV1xWSShWvVzubW3yD39GcfR
	 rRAMM+w2j0JJmC0x0BxhXe/ThR8+qn3f0qF9A24LSLX5y0KurigoRSXkCSe4bAIkjd
	 vbyhQh8li1yTdDalBWUjVLUTJtvd9+nIvnMdno+FyaDLNaAfATauir/O4X4ey4w+GS
	 5KG8n3BKIIqLzasUdUUok+bzJmgAImHdTOiJIgCqvIkSSZ2qdFTHOZMMgnsQ9jffQg
	 GKUEB3FTgMf5/Y81x6iud/PdSEgMccFEeX3i/2XnBnGtJF14SmrdbGOPVGqRmjf0Su
	 MtPjn/Cgv0qrg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH 2/2] arm64: dts: mediatek: Correct white-space style
Date: Wed,  4 Nov 2026 15:50:43 +0100
Message-ID: <179380380618.180018.7896148513810825073.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210230.383532-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210230.383532-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=573; i=krzk@kernel.org; h=from:subject:message-id; bh=BjSKvKBqIobtiaqSh/IRJbN5M62UkGlZsyhzr1CyR74=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq60ZExfV+JXQEvhhyqjYr6PYdNf+BtGljRM/yT a5JRDHFxJ6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautGRAAKCRDBN2bmhouD 13aND/40fYFvUPaDNgA89KoubKrhjvlBh44Svcn71TSEdMaWPio5GXHqtqqPWWAYxyIe6uGW/oc Ai/XToGaTMgWIYn/AmczwfRGVWSVvNd2w6o0tl6vPgkEIsE0bAq2RgtdjYU0E4Xi2GqbbMf26q3 KZBAVTFuEfhwT0UtRND79MCr4HlUD385bs1tmviGydazQT9A9Co41hLJEoqDR2940Mxuhk1cRPo /Z6Ia/E/bWePokbhsJkj1EyYFxL43n7PSVfbuJNdkwulRPm4Y+Lhw7Brbbeq9sEsu3LFZrixmCd m7fHBewpdxd47IDZzyx85+TOXvZJIIsmJ5uEgsa8H2OULXPQXYdg3QYli3qYHpBi9/22wq9d0Ee CtOMvvW3FhUFkozlvfKiz4fxaGG6O2U5QjtfX/QW+0ijmrInaM02hLYkRa2OpiZb3JrcSJiuwSU bYzyp6rJc5SY91Vl5A7Afh1Q2Fq7kGKwAlxXmMIOBZQ+L4JR7yfGJj1aZDFwqSbfwnfO9S3Gr0z TfqGaKigK+XcTQWa0D/3QoOtH7MFH9Gy7FU9YVGSWaAQc9JUGfPbm+/PgnNhp3dJGVr7UCO+Dod ASbMK6CdVK3oZhCZDMSxRSPwlA6Xr15+GsKwoN2A1TOZCD4LOCi+8hc1e6BmWEa1Aa3C44vfjsv C7reDVd+7j+f6G
 A==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, 01 Aug 2026 23:02:32 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

This is waiting for three months without feedback, so just picked it up.

Applied, thanks!

[2/2] arm64: dts: mediatek: Correct white-space style
      https://git.kernel.org/krzk/linux-dt/c/30c1d0c701b4b9cdc161606a21184261f9ed2517

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

