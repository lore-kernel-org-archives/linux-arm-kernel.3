Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2363E6ADE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNHpUUCKsjbwdMFqVHuhT5oVdX8DswSwusTo146Sq88=; b=cwrsJEK9d8r21pM2O4OMYR589r
	XrigR5H+3hB16qhCJjKS2oOeNTq+f8jIjp93dTFHTol4y4BbpAoTadBo6BTsZWiNDozvPvmyGN8Gi
	du7VRLKSsj2Z99ViHhlhTELSR6JZ24BQ/Z5XdIIoZB7zSpBF6QbFBkiJKSaqYgosATwoTkUmpP+qf
	8GuG7nm9tAU0qvMUuxDEEgQf159u8PrPC4IizxuAx4ywYS8wR1qp61XMB3exzboGLv6eP2GiSD6bb
	2FItO5Zrl0nAxOqPWwkMnZgnGm1riwu4GvvrHmZZbFMCP1gAmgvcHIyiA0URzvHavzwhzmLunA47A
	sjpc3u5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEsub-00000004aqd-0frx;
	Sat, 23 Nov 2024 16:23:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEstf-00000004ahp-2W6B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 16:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02CD95C5532;
	Sat, 23 Nov 2024 16:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7ADC4CECD;
	Sat, 23 Nov 2024 16:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732378930;
	bh=rqrZ3vjyZhrxtWn4EFzMu1EVgsI53q7sNaMFgE9p/0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5hiMYu6E+Hf3BM+fN1iB3dHoPal/EV/V5lel/OfMXeL3mndSaoGXxkoiQmRNpVd0
	 ThMRz38hrfgwelJ9y74Pe8STfKB3mMj4RsLXrcFf4BoL+fvnbeCw0LPxKrpLFtoBLU
	 wx/1SLV39pofXw77R6KmJDqZacOCtI7SNv8L0+KrDVpuVJ0u3v9Qf1mzTdSf7OTRnN
	 2xVMJMDozrK+WlAg0AKb8lopUSocby4LzGnd3DfzXyCbLVr48CB09Y4YWL+h1c0OWI
	 uDf/jz/+qkWblxhPCiDG57hFpjJU6vK6oMxlXBQw+ep03CVOkL2c5fl+bmqCHbuZiI
	 CptND575uG3FQ==
Date: Sat, 23 Nov 2024 17:22:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?Q3PDs2vDoXMs?= Bence <csokas.bence@prolan.hu>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: sound: Add Allwinner suniv F1C100s
 Audio Codec
Message-ID: <juzxtwlr5ayvjrrqem2hr3nbyem6oajwrvveio5brlzazdafov@r2aehknf4shv>
References: <20241123123900.2656837-1-csokas.bence@prolan.hu>
 <20241123123900.2656837-3-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241123123900.2656837-3-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_082211_692222_DB18A5C5 
X-CRM114-Status: GOOD (  14.23  )
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

On Sat, Nov 23, 2024 at 01:39:00PM +0100, Cs=C3=B3k=C3=A1s, Bence wrote:
> Add compatible string for Allwinner suniv F1C100s audio codec.
>=20
> [ csokas.bence: Reimplement Mesih Kilinc's binding in YAML ]
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>
> ---
>  .../sound/allwinner,sun4i-a10-codec.yaml      | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>

Missing changelog - what happened here? If no changes, why ignoring
received tag?

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation: Please add
Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
or above your Signed-off-by tag. Tag is "received", when provided
in a message replied to you on the mailing list. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for tags received on the version
they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/subm=
itting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


