Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB41606C236
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DLZYgZKK;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZlvsI3O7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MeBKTA0b9gdc1oZ9om4ZOcHEMZQgFvlj1R0DbKnQy1M=; b=DLZYgZKKzBPYI6
	Nz0zRtwYdKXGXQujbEq0JUfL030wmNejKyLnF+T0aaoHuqqtwxsRuLiWh7wib1gJLzXxX2qqNOw7j
	WFFrV9AdLwBkGv1WgAWpmu03ubaMRXwFdnzeMUIqn+ZzXngCj+GNxutMQ4Cooetc8lgr+nOe6hUHH
	K4Y2ApSvt6Fyt2Ui7YpwIysWvpXCKpUBEn8SSP6wU2MVVImCva0P8lUIUktUyaEIBHNkgVSDFav6z
	/qgWR7IR5qmrW8ro7IsZtNUH5oTjKuJ44aix9hHd8DRvPOkXh6fuQdy38XBD1lxRvcuY3c/J0+k5H
	c/pDIKUC5wDPC+JiGgag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSh-000000029Wm-3Z9H;
	Mon, 26 Oct 2026 09:57:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSW-000000029He-1J64
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so20791925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008659; x=1793613459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MeBKTA0b9gdc1oZ9om4ZOcHEMZQgFvlj1R0DbKnQy1M=;
        b=ZlvsI3O7fJafrgzjIsTFD7OAGNhoQ1wJgG8MY5IAS706QiuVnSiDhWEgKHTMXayKDi
         xfVbxWhQPgRfv7czaaQVhwxVDWStYRapnOjLW0iffaeeczk5gouHv0sIkR9GJ7aU9gem
         KBWEIHTkPxRckI83ofzMy+k8s/s/jzGz9VvpVuoNDhLwaDhKvyaa4W+xFoJlav4d4L4d
         iTxCIPV3qjfo3F/sw7ZMGNR7hlQ6euCTuy9xzsy+i7La4MZ9jx+G0kyxi2m++N0ZF7sr
         f6BIJWjXljp1XTP+feETFCQABKxwFlNlEFfL8g1vbPFZitLGh7a+zMFqbpSrUjd6c8E3
         LQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008659; x=1793613459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MeBKTA0b9gdc1oZ9om4ZOcHEMZQgFvlj1R0DbKnQy1M=;
        b=cSu8sbPQTE1OIrkYro/crSp3+KfeIFH3vmJVzxzbg9QtWAfpum2d0QmjrwlhgKr2Qe
         Z8gVg+Ru2X6HwRhduYHAslD2lbB/e7N9QZrJlijY4u5+8fH1lT/clCbjyeycNE5avlcg
         ZHzKUhVFXUCIupUd9YsQf6PQmi6oDIwmcEN+5wAuzQleuoMnzqmfJ0EeaFTJwDoYdQKv
         THPsAHik/hggTT8cAiBqw3afA0z8JTXfOyjeb2eUvIWv6/7rHw3C2S4UY5H8Ir67MqCe
         ZqDlmY2z0VY0qeYSrBIXwhcUq4sFrMTlJsh0dE8bNTddEIKaGpVQ0KK0s/lhMCI07rVD
         6bLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhKsijwORIOsuxGQ6X4ejG57ePh1TZZ4yg+IITSNORtgVzIlJ+tlxW5xZP1pNbzRZ/M4r+6qOeJ3junrr07apr@lists.infradead.org
X-Gm-Message-State: AFq9FYJZyvUfXAsiyZqf1Q/X2aGVy9jTVSV3mumTslhn5Yjh2pGHRziR
	zXkGRxIBBj+Ulwq8Pre4tXt0fdG8UlOYmHWZGF5GqWoi5ZWxgtqpV6/v
X-Gm-Gg: AYBFou3gfxSoWJc0x8P+AsnHcjqtK3ZheJe623LEIWi/zYhvJRzHsVy1D5orjU1XYh0
	TVjGm1WrMvBstvp28vVQq4E8PReppYP/QQ3Kl0dbhlXmOqtErI4a/nw31kTDJiV8i+0mP3N8BVF
	0z0JtmIcKOGNhrD3b6J06TcP6ULUUafHQUsCS1UhEXECBQsxzg2imuSGFM7ZQAqkIsfzXBzbL/2
	X3lO1FUHIIGoJvqlsFTJPpA4uDoqKHfEMLaPcccsX/TgqcFgbDlF88HjXJ03Ta/hddivl9ecYPA
	ply+C2+poCQWjhmDpJZYJ5wcagJ1FY0FFCmE+O78bQxGCERGEsyoAjXEWvlFBHKGVh8wATaYVhk
	07Q8LgUmQ8pL0Thx26tEGL6TzWgZRe+XDHSoZAG4Lx5B2RAY9PtmHFE+nXMDdWZFjLCYrcLMXg9
	VhAuBgzWkCe8OwPViN5M9RyZx1V4KjEt64VhZETAjoUFrOPv5FRxTA7hD0OnYily3AeRXEbHaid
	6GGu0bhw7ys9ucxCu03a75LNQjQ7U/V6sr3xhmr2Jq0j1E5cbZ9Mfx9GSgXL1bhpHHMtKkBQTtc
	FH6Ha+D86204rasWIolCnstWFpx7v76QeP08TgDDN8MUaqwvIljBPSlW25HEO5FEhFLwQwjpygb
	WvOy/4Q==
X-Received: by 2002:a05:600c:8184:b0:4a2:9cda:57b6 with SMTP id 5b1f17b1804b1-4a35aca71c3mr100497405e9.22.1793008658493;
        Mon, 26 Oct 2026 02:57:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] arm64: dts: airoha: en7581: add Chip-SCU accessor node
Date: Mon, 26 Oct 2026 10:57:09 +0100
Message-ID: <20261026095727.31708-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025740_356344_3D82382D 
X-CRM114-Status: GOOD (  10.46  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add Chip-SCU accessor node as a companion of the SCU node to permit
additional configuration for clock, MUX and thermal related registers.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index c5a335086741..fbc5ee47523c 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -342,6 +342,11 @@ spi_nand: nand@0 {
 			};
 		};
 
+		chip_scu: syscon@1fa20000 {
+			compatible = "airoha,en7581-chip-scu", "syscon";
+			reg = <0x0 0x1fa20000 0x0 0x388>;
+		};
+
 		pciephy: phy@1fa5a000 {
 			compatible = "airoha,en7581-pcie-phy";
 			reg = <0x0 0x1fa5a000 0x0 0xfff>,
-- 
2.55.0


