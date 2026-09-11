Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C6FC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1+0j7J5ZpJI6TOnTARAeIZd9s6jvK/5CqiSBqtUMYY=; b=W7YVdRQXliKjSNHCv9aR9emdA4
	hEUX7gbXIZl757vtEwCpd+wO0dP+Kk5xhs31yC5JDKMU+LILfTSsPONHFDoB0bXpg174YapHMo1cr
	8bkPv+OMvSjx6mVdpgui5y6HLm9NXYX1WUlIylQdrr0PFaVwVBVdr7x1zeolTY1b42xdrDCXI1dSc
	D0BF5icpEtFNS1ky0EheaV0fzs8NR+nz9eqhG2xgSRp49rAvHczDJXfGpB/aToPTLDHMN3kCFIxuR
	b9d9fVjlxM62LkG5oelLdV2pLrqNKRw3uteeMBtC3qCmjasW/ef87G0grSxF4kWx2szCjTs2GcnSl
	Zg50Nzgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51ju-0000000Gpu2-25cJ;
	Fri, 11 Sep 2026 13:56:26 +0000
Received: from mail-106102.protonmail.ch ([79.135.106.102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51jr-0000000GptV-2jb7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789134978; x=1789394178;
	bh=k1+0j7J5ZpJI6TOnTARAeIZd9s6jvK/5CqiSBqtUMYY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dunsq/Mn8xVosr7i3Y5QIn191VbPt7R79Cappcalygd+G7f51hFCKhxQWEByVDQqk
	 C9XOJy8FZl6sYjILcuYr+HTp7BOs5wFPA46v7KDKurzuk5QYVtXQO2SAiuDy0FI3CO
	 UJt0DuaFfYsmMXTCdwREaOC1cbSA/EkcPZ00IUTduD9ZClDHkRmeP6LnD+b7vgHJu0
	 7GjHtg85uUGYEuVyAFiflj6uh8ZOplCoztxe8I13crWSAGGHBT8ib7ngbRydLKw482
	 PZ0hhSEvpkGw7FJ2rV7JP4vwsNw5YpK3i2SOdbz6EwOFOE3Je+lKMKc8aIC13mya0M
	 K//TgZR4CT71Q==
Date: Fri, 11 Sep 2026 13:56:12 +0000
To: Conor Dooley <conor@kernel.org>
From: =?utf-8?Q?Juan_Carlos_Guti=C3=A9rrez?= <jcarlosgl96@proton.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add SPC Glee 10.1 A64
Message-ID: <bZv581NjWaZxsz6ThV-eRGTh4T_Cs4KEkXCXp0A_nsjcF7A7LCkChZVBb4--RIFJO1NvhHiSqT9aoVj42MsvzSMzqkkPTqbW3nRcZMH8UgI=@proton.me>
In-Reply-To: <20260907-stock-eggplant-d03a9df18a22@spud>
References: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me> <20260906-b4-spc-glee-a64-v1-v1-1-621df2155e31@proton.me> <20260907-stock-eggplant-d03a9df18a22@spud>
Feedback-ID: 47397442:user:proton
X-Pm-Message-ID: 2a1c6f3511eb1443dbd2e5cb49c9d77de84032c9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065624_464916_D80D4CA7 
X-CRM114-Status: UNSURE (   4.63  )
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

Hi Conor,

Thanks for the review. I have changed the vendor prefix to onspc and
updated the board compatible accordingly in v2, which I have just sent:

https://lore.kernel.org/all/20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@p=
roton.me/

Best regards,
Juan Carlos


