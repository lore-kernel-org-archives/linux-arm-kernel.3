Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C97606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AKYvZBZf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YolLX4Ue
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HaDvqqM1aHY770KYqszI2Ek8CtfQ6a2OxvtP+NU3+wQ=; b=AKYvZBZfC9MwEJ
	hpB5bET6e01jh250Vag8xZXW3KyzBTS52MrapAZ0Ylxs9j/1Pe1Ft3Caaj/0Om/ORQK8fhywm1Vrw
	3ItE/wH9vl8eHpa52doDItGHlJG2cQqJxUKoNY43Y8dQYSoOQIEAzduncYztuzffOVV0OyQAIabhF
	UJgLFbWTLMN0u+47lEVGX8Na2/CS8xpxCDzSD5tc3zZRjMbXeSL/unXX7yeIS16NJbnzKlaHLWb+p
	g3LoVtPBOyCIRblvEsqGRb7y+APsmOG/LV2TRSfo8oygMRa4BH5EvNyovDfotgRtyMkBL8rQg/g1s
	9tmtutt+/3Gxto0XqLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxy1-000000008WT-0h3l;
	Mon, 02 Nov 2026 19:45:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxxv-000000008PY-3KH6;
	Mon, 02 Nov 2026 19:45:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46ED344520;
	Mon,  2 Nov 2026 19:45:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793648711;
	b=gCY9Sw5infX66iayivlWj57SK3ohKDlFeDQvALk9kQfkiS3nA953VszldQrVzMm5cXMT
	 J8Ix5aEaCbkYWb8L/vd3AMCIWjxi7wlALue3/qJi9wp9kUnmO8GbABn/1by00GCHpXDH5
	 Yt+eCytFTRKw1up+WpkMODIlh17RaCKVajiNPEfG02/M0g9y9tCuib7+006mMJ8kuPf90
	 q9UfVotCIrXVp/EgOTGcXMA/0kB1Drv+GL5itLmrp3ZOC4taSweS482Li/L0mdj1+ro6R
	 RvWSFDx+ZfhkoYn3zrnSscpn+0Jz4L7gyZTRB2nkPMPH+gEYPEiI6J+O4NhngzQoAwg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793648711;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=HaDvqqM1aHY770KYqszI2Ek8CtfQ6a2OxvtP+NU3+wQ=;
	b=b8IZhwtqK8ZQjXH5oZN//g6gInBohGkdNB+tMsuQlIT46nukOods6OA8U0cf/pXpzW+y
	 Vgq3gSAji8VW4XB1rzKzNgkUYLs/N8nmlRMMN7nPDcZKTzmJSuhiAYIOOaHOorI9WjiWM
	 rH5OPdUxj1BTXPOEEOWxLzoB80BiY6ouOwkFjqrx2K+mR6DPDY2deR/0cwKZnArHdiZ35
	 BrE0ZHmkZJtCFGfOxh40EksrPjPiYuAMSm9tU2xXeU7bLMumcgKvj8BS9h42QbgK6qlP5
	 mUzHCZhW/SwXkQ1CWQzw3makRauH22fe95uQv59TZQxqnU09Up0PGjiPTTmxdU4DVsg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F49C1F00A16;
	Mon,  2 Nov 2026 19:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648711;
	bh=HaDvqqM1aHY770KYqszI2Ek8CtfQ6a2OxvtP+NU3+wQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YolLX4UeIWcinCTZMwcPOnHtbpLUJ1Sm4h2+pNBInaieR6ih/ZVy9jAtHUx4qOqSo
	 19hfnbV+PYuSnNzMFqhv53h1+xFsy9ORpomMeoc1PrZqP0aXwKkQ8jfYZ7fl9T30i8
	 BPFHdJ4Wd2Dxg0jy+KJ2VkevebmZ3p4NgqKlxFXod1W+UBIxha5wJ7zLwus5uv5/DL
	 akbPKN8VVTYXBlYTPjtjWcDptgQnVrGwqHjqkVdW9yUQ0ar2KS7+9hdfQJ/OnZG9hh
	 tUShvoIYgDByp3L7Q1Qa8KNsx2fElveGas3qNSWswe8+h55hh9rutOpxXTk2oWbAE2
	 WEV3yWDUkhpCw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C064B4660A;
	Mon,  2 Nov 2026 19:45:08 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 03 Nov 2026 03:45:05 +0800
Subject: [PATCH RFC v3 02/17] dt-bindings: vendor-prefixes: add Zhihe
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-a210-scmi-v3-2-ee6b31580808@iscas.ac.cn>
References: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn>
In-Reply-To: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, linux-clk@vger.kernel.org, 
 linux-serial@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793648705; l=895;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=NfTLhXrzvQ5lJQxz8O7S6dCaG/HAPcHpRM6wkHRi+5Q=;
 b=EkHFLciIZZch9iuzOgwnaOmlBKnGOxBB8HE+LG+jczcEBL90Piz0He2kOn+rtz71Xo+GEU838
 hwzMmb+9JLiDM5aTAdDBvaE/0wPenle5w5E4JW3Kx4+wybSBOWepjx7
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the vendor prefix for Zhihe Computing.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..e6db332510bc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1995,6 +1995,8 @@ patternProperties:
     description: Zealz
   "^zeitec,.*":
     description: ZEITEC Semiconductor Co., LTD.
+  "^zhihe,.*":
+    description: Zhihe Computing Limited
   "^zidoo,.*":
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":

-- 
2.55.0



