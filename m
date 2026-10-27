Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CF3606D93B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y2EljUTZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cnGXNasM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D/80EfwAtXJCC0tZxo33X7RmKZW37FWB78bJeXvz28M=; b=Y2EljUTZxnx9+QtxWXzYuDObNc
	Y3Uvxp32qV389816QxYQ7YjfzEDX6uEkgd9G4Q+CDCVcoF6S9bziBBlaNZ0CfsEMo5DXgal7RIsab
	0a8XZDwgDlFx/MaBKRf3c74HhAO6ln8bqbnHBBw/rg2yb23RCxN3nD1tPXJh3bntDO/QrZfagb1fY
	2ZLOog+dtnrXrxisKxBjyYmsil5KzkuKd3T186VGa76u4UKerL1t+eKgVwhsez/PpIkH/CLQtDaLq
	MEEZdyuuaHfDsDZajQOKYRmoYcCI1oqkuQTVv3wE8R4MsKP31RyPPuEWhmzhzq5iGClT+L6eVlz5x
	nehyby7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjF3-00000005CTy-3sha;
	Tue, 27 Oct 2026 15:37:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEX-00000005Bjf-44Ja;
	Tue, 27 Oct 2026 15:37:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC3A743D4C;
	Tue, 27 Oct 2026 15:37:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793115425;
	b=WKogAzpMuZyEIVz3zgmPN2Dkw0hWb6ZrT9eyC7dkEe/a6CdSkkDYLLc47/iHvHOMoj/L
	 oY1/E+qDGA7drlQmthV9mm3SP37au+eGbPf1WTmjXmoYIx17RYTGiIqBFW57z3jHdSrhF
	 4Gc9o0lajHgPsmkX4R9L3hTunZqD0Ax6rn6LlwWRa+s+WAtOACCS1vf8p6kOwgig5O9mc
	 ybNuhubKEIhdCAaKUFvwfnECSxf1ln+q5KUaFCDRUYZmVlbx29/e0V9rQrmfM17Qhe3JV
	 iMzlzdkglVhX4kClxYJh7odRknfGVfIjGICFSZ+yXKKRHZwb/3F6sekMO874bO3jAQg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793115425;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=D/80EfwAtXJCC0tZxo33X7RmKZW37FWB78bJeXvz28M=;
	b=dm5ZrH/rFgFLQUN4ckrpPzq1SwsNBi6R8V3llAgQpavNeaQd98FHs1905ma77IRP0I8m
	 0+aKtAyOKtQOvFwQIeby78rkkk335DbY8IbRFnm3w0jmQsW+GOPSKdVKX6EOvopDeNEy7
	 hXKvHFVKYLKKAPMqtS144UF46bWt4Mrj/oaS5vqIkW4U+JAW55sn3vLdYZwHSyCejwF+x
	 LtHmDkj8U0C/ZUNoy9/sYfpPF/DAPDgxn90kSlShRT5NRuEH76Xp6N13MrXJkAlCduCvV
	 FXpJB53I6ami0mTGMPiK0kreI9uRsWp0cdQSvQ+gKxDad2Yz8pglRhn/xuB4rnDG3ig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9B831F031F5;
	Tue, 27 Oct 2026 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793115425;
	bh=D/80EfwAtXJCC0tZxo33X7RmKZW37FWB78bJeXvz28M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cnGXNasMvPhkUgVo+5pt8BHt5kuJCKFeYrIiu42mUM0QP11MS6LX0of0qAYnaPp4+
	 j9Y0tsYR/3VQeZfIuZVo694LxCh0kvBMjfKqq7hJ7yW4OqpaShMgqcPEoV4eA0b7O2
	 2iTN4ggOr2AJYQFchhc6Bif/H/5GtLANw3RjQe3+cq2QxOtOIVKTz6LB4FTDsG1Zgw
	 KlezO6mH+Ijj+els/+KsJLPROUO4/WHkBDvw1U0vD1JlgtShD1Tot6doKABlRrWVBs
	 Jouc0j/HKfZ7kzpqD950880hI5yTzJoJzeqLE0V0Vr7sxzgrtVTH7i3ehVbkLIcG51
	 vn4lv9UVylwtw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 895A64515F;
	Tue, 27 Oct 2026 15:37:01 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 27 Oct 2026 23:37:01 +0800
Subject: [PATCH RFC 10/18] dt-bindings: timer: add Zhihe A210 CLINT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-a210-scmi-v1-10-74d58ce85bd8@iscas.ac.cn>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
In-Reply-To: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linusw@kernel.org>, 
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
 linux-serial@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793115418; l=807;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=mOLkOh4/jpI+bhz73rcyph1kni8iu4RhyVF0Wak3gq4=;
 b=KeI1lFZVfnK0DXd8ETZZgB+ksVJayuij7OJj1hfsbtb1XteWB98ctRke9ZnIc7FXDmCk4+PVq
 /wpwjTFIHK9AdFBNUk034oWabJBv0PFrOe5o8bM35iqFLP0putZ2BR0
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Add the A210 CLINT compatible with the thead,c900-clint fallback.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14de..805262bb6cd3 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -56,6 +56,7 @@ properties:
               - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
+              - zhihe,a210-clint
           - const: thead,c900-clint
       - items:
           - const: sifive,clint0

-- 
2.55.0



