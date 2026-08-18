Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E4DC5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5uXZkSMmxkkJP4Iw3lCwsoePNBkDJ5EoPvAyCozyRw=; b=k5D+Po4Zbxgw7xalNFHTNio2zd
	WC05lEavVNZmFO7y8mz3TPZ+63nKbOJLQrUfDInYZJzxpzXM/vuz1R+ikT8gruK0zOXhTkxhExZOJ
	FOEwIfUxrIsYQVrw5LOpM1G5sLLABmxdIoTAv9D7nzZr6WqAn1Y687VJczhdWW3ehvnKDbHbuAIiw
	Qc/0m7/yJDX/w2lWudIkiF473SXsmDXGTaqvk7nb/TvgnveANgeFGlC4rHUJ1LzDKVoBnW59f6LAs
	/reIFRVGSj6aq/IUcZvXIJrehjfS5C0XWyvEIUUPc1WEU4MoBiyvLv0ZiMimSMrbRb9v4b1BWzkXS
	soOhz6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH7A-00000007j6C-0VqI;
	Tue, 18 Aug 2026 10:32:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH78-00000007j3q-1iIr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C74D044082;
	Tue, 18 Aug 2026 10:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9277EC2BCFA;
	Tue, 18 Aug 2026 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787049133;
	bh=QVo13gwqTD4KZzt9imrEAhoQPNNjElG0xmVDlRWUyNI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lnN+DjGHeo2tlc9vycESrAeCBLVQTWq34Njnvezg9CzWCbnonP3YdFTEXOlZTeByR
	 zzadrpuPzV7YWHtK4mhkBh3gfV9rd+XJkJHGeXrAmEaJ5Mpxr0D/tIe39cSZ2Vkq+h
	 f7GqjXbhgVb3KuivP/easo1L2Nr6F8LZzafUCA/WolDufpmfwjj9o1wODX6j7Lkh5Y
	 A2XbrsiyGx3Ze60XRvr7xG15qTKlwc3faQq+Kjh0RiT2DvqZkPbks0uwsZACybJfxi
	 t5LDBsW/8CBsVTdfjnR4XMY65yP2xMLvmqR7N4z6gNJg+3/CvK1ZPfyTyWK5bj68fq
	 CyCi4w/kyjKMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7156DC5DF80;
	Tue, 18 Aug 2026 10:32:13 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 18 Aug 2026 18:31:16 +0800
Subject: [PATCH v5 02/12] dt-bindings: mfd: syscon: add Ambarella CV75
 secure scratchpad
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-cv75-v5-v5-2-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
In-Reply-To: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
 Long Zhao <zl020895@163.com>, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787049131; l=864;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=UZUyXXBBt/U6PUqQu+CGVwiN2KK9z5EYeOVD1g3SxZg=;
 b=T8yD7k5AUqFRlxCE8adl8w66UEPKZlmwNFkLbqgX9QAVa/6oT3PaPWQtmP1u4FbMy7fjOmrHQ
 gK9z87jqEUICI07g5YRbWrqdiPaZHBed4IEaJhQQnJwBc2vYstg5t3W
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Allow ambarella,cv75-sec-scratchpad as a syscon for the shared secure
scratchpad registers on CV75.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index fe882d3f828b..9ebf702c06f1 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -32,6 +32,7 @@ properties:
               - allwinner,sun50i-a64-system-controller
               - altr,l3regs
               - altr,sdr-ctl
+              - ambarella,cv75-sec-scratchpad
               - amd,pensando-elba-syscon
               - amlogic,meson-mx-assist
               - amlogic,meson-mx-bootrom

-- 
2.34.1



