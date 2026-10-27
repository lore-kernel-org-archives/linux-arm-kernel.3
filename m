Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC19606AA1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u7MnpA8a;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rx+apCM6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RsU/Miju2jeqymvYcNJXTnmmqKzjTj43vuEKKcaUunA=; b=u7MnpA8aEryJ2E
	TbvZBudnRI9K29dkGt9744qaZV4RwyEqR3CvFIky/zGKPFuUdRRnuMz0pydLvilwY9JmBOT7R5NJs
	k30sNkOP/jS9QbvB2cdP8/Pn1VNE9ui8XEknLzExUYgJCBDbg4DE8V17lB1Sf1VzL43jnvb6zqpLK
	3tjyopud2NePwlzzXrODnPdqC556LePNNEz1Ik8euF4G1S/0yVb5OKT4NljMPSTsZy5vr1rL/MB+f
	5NdCo15BN0hm4PolcGDSAe0j9m/0c4vKzWR5HMvnzwgLn6ZPme6c2A97O6PMlFB73WnNG2+elKy03
	e/er5eUuVNCb/IDDBaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEW-00000005BkJ-3mn3;
	Tue, 27 Oct 2026 15:37:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEV-00000005BjM-0gyC;
	Tue, 27 Oct 2026 15:37:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BF3540A65;
	Tue, 27 Oct 2026 15:37:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793115422;
	b=I58PmCtMOsJSyv7CfUgoJnDx9r7C1YjBQXD4CryF2Jr7SAgsMSvejo7cqiV5cDQxIv9u
	 hSpUHHj+bNXqXtD3j6WEReMrrIHYaJ/S02Go4KngscpHHl1uee4JUZAMDBfvuDKs+QjvP
	 9+qSft/lJ+UN5G4U87yXp4XlHi2B/BxiEzxyJ10k+yLTT8cuvTczkum2gCGk/62k5LJm0
	 w5+8GXD+oAe5GjtuOnAyQD6yKln3bfntUJSzQBHX5V3zKQwhIteOLj0MM1LTRSCkrg9SF
	 B3p4cm8Huyc2TXUbmHrGWJcvcawCcV/CVs1JChhLRNHw3ha/bIBn0MWVMajhoIsosWA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793115422;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=RsU/Miju2jeqymvYcNJXTnmmqKzjTj43vuEKKcaUunA=;
	b=B3ELMtPMzhBI6yFmB0tt5UqJdykqeSycVTzrDEyamoGX3wmFWsF+v5jvs5kLtKBQBf6n
	 Joow1II8vLA7sAOgBYKBflh46xjASbfA9yCEAFXj1jCeBakRxhSD62MFnPWT6dJAIWaDM
	 floZSnftuzBeUi3Yn/Ux1xO1wQbS2kZicAqTgywC/AK7mlJZIMJV5OG0iS0QN7odSCYL7
	 0HabDrEgned981lX1EFKyeHGnSjVh28zL0xqKuz5LVIaAuX6WX+m6J84omY2hZp9UPKYJ
	 9KtwmNHLeocbeXp/JLm+eeT0e1KlqgA4qzixn0Wg7+pYAoDjPTzlH/aIy+i7J48Vvpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4BA91F031E8;
	Tue, 27 Oct 2026 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793115422;
	bh=RsU/Miju2jeqymvYcNJXTnmmqKzjTj43vuEKKcaUunA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Rx+apCM6EluEKSCZHQo3m3NYIdPozD/nSGfKZYRDvgzctsvybIhlceKPKQToC/Is3
	 oMeFqxtKbu4VVFQs5ztaZPY1cOVHEhbC2dB0HEqyL2ZUTZbON4oGZIJkfiAPski2oJ
	 TZoA0yExKlRpeUYIpaDOaRkuAUqgw5uu7dAQuzcvQXJOH8IHfA3DqvSjnXaP2KZuRJ
	 UcoBoIjgt0u07m0Em7NPyBQsWeN1woMnwI2wzVxUdcpMlLih2zQwTSBHAt+7se5Q85
	 YU2ELf3VqHg4vfgFb9u7BiMkXrCqVBS2qnclhf102ifK3/AbU5wm55HD37c4SS/Ju5
	 b3hVKEIuSh9qw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 307A64513F;
	Tue, 27 Oct 2026 15:37:01 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 27 Oct 2026 23:36:53 +0800
Subject: [PATCH RFC 02/18] dt-bindings: vendor-prefixes: add Zhihe
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-a210-scmi-v1-2-74d58ce85bd8@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793115418; l=842;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=78H4CNA6muw7rwfV33m2sQ0QfyIqTcYL4B8JahPXMn4=;
 b=ZlIYxo13cmOAFrP5dhVx8YBV6beEABXC/eF22oDJ1AKXa+I4RIFByDZzWBlPUSIX3TUDFFQ9X
 hNEt/8H6owrBYrIHLOg2GkAvpO6b8uJOp8WCZ+bCF9Bmd7iZjztiPwo
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the vendor prefix for Zhihe Computing.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..21142578837b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1973,6 +1973,8 @@ patternProperties:
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



