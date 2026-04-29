Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7A7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4i7Xm8YltywNE9Vi6II5NYEZBD1iQLfp4F1NTKsRcg=; b=lZPtdXeRpsmMB5yzwMsEiJM8zR
	//pyFy/dBGdmnYGtd3HNZXWamnHnLxvhsoyquXmgvOGrfJ0Sv+g2UCgNas+oorSSJSknUK+eIa8VJ
	MJlZFpFW48LGJSD5Dr7a8vktc45yV6pYRD9VABIyka1AQkG1aGi6wJX6WZu9cIFHOrsaCBaoC4j6u
	mFtC8VJ3jHNzyhYE8ru6hwFBfK3zp8SgsPtW6lM+TUwQalAiq7+Le5QStCJfOJoXFDL0xceNvRqbe
	Fo+DH9qGoDdm0EJbFBDHvfOYImnx8GDLp+M6MIc/Etn4uCahaeGGTvcpHeEKD8mPqmni9ujdqu48I
	e/Yfnf/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvtM-00000002s1w-2zpn;
	Wed, 29 Apr 2026 03:47:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvtG-00000002rwr-2lyF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C4FF40682;
	Wed, 29 Apr 2026 03:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2DDC2BCC4;
	Wed, 29 Apr 2026 03:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434430;
	bh=i4i7Xm8YltywNE9Vi6II5NYEZBD1iQLfp4F1NTKsRcg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jpe+EyN5vlo3AFXgHK80+TWvubFVayxRprfSNv8o9GmYj7I4Lv1FpYN58AzXDR5iZ
	 nkU614mr8rMANZ6n5xZhGTkB4C/dMRy0UxFVxLk1L4QfHaP26HC9x+HtwVZt9erDHV
	 JUPvAv5QarVcjNpLq7S2sOWEc2g4IminhU/dWysUgAOJutxqaf5PwgAzdFQdV6CveB
	 NUfniOdOAjs9MIK6e8OP/76KFMRfaXLGrxS72ZKcyoHMOuljn/RZjYh99c5kctuovW
	 D4qPtIljLmQUCjtyda761hBo2Ih7NcC66YF2ePo6VzP3/lVcFbh1b4ZPezUy/BXHy2
	 hOmCKJgSP8Jqg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260414-pxa1908-clk-reset-v1-1-94bae5f3a8cf@dujemihanovic.xyz>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz> <20260414-pxa1908-clk-reset-v1-1-94bae5f3a8cf@dujemihanovic.xyz>
Subject: Re: [PATCH 1/4] dt-bindings: clock: marvell,pxa1908: Add #reset-cells
From: Stephen Boyd <sboyd@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Duje =?utf-8?q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
To: Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <dujemihanovic32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Date: Tue, 28 Apr 2026 19:08:36 -0700
Message-ID: <177742851672.5403.5765326540508025807@localhost.localdomain>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_204713_087881_211BCAAA 
X-CRM114-Status: UNSURE (   6.10  )
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

Quoting Duje Mihanovi=C4=87 (2026-04-14 12:51:50)
> From: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>=20
> The APBC and APBCP controllers have reset lines exposed. Give them
> a #reset-cells so that they may be used as reset controllers.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---

Applied to clk-next

