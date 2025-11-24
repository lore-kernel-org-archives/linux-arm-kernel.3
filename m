Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19066CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 04:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLoLSRS0goZRqoYuNJwGXmkVYLQAq/toqhyMWgS8220=; b=znlYSSg8bH4CA+YJcst7bG/QMp
	YOMT7HS3J7H3GWc0wzeklNZ43oPm4fpo/GhAD5dtXocpF4UBRQDEmIqH/Wptfykr3u6ujIZtMiMRd
	nEVaZCTnE5OsmyatmiQaECbG3S2CmQbe77ruQ4eLPJ4Eg1+Ltenw+ZTRKhxQBD6X0OQVB6nvUu2Bl
	HrY0A34GvTSC3M+kIni3KVZ+Gxxo54woagT9UA+U6PQvQsAQ6HOxzn6K/yeN5moWrAqRywPzBC//i
	URWwe4Fdu6QI5i4VXhhY14iWzSonx2lrBoQyskUjWqVEzCauwutA9BqXmvHfpgxK6Kc0AU4/Lbkad
	sjS1uXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOXq-0000000B5UU-2kl4;
	Mon, 24 Nov 2025 04:51:22 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOXn-0000000B5Tz-27Wy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 04:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763959877;
	bh=yLoLSRS0goZRqoYuNJwGXmkVYLQAq/toqhyMWgS8220=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ffh9O5Z4zQOoVQ0ABvwI0KKeOL6UzL2f6GCv9mGCKKCeG5B+mEvRKTyG4PFLqGmKT
	 s2yOZcU0nGAX9ueJhruJ34RTQiXEgLprVIWQWgEJDMMLo+lOqffM/7tu8zrnMcspCA
	 J17VOp1nyY9WRyZ8N8aE0LbAM4GDROb3Vad4Mnqcg4/a1DqkW/Ods20hqqFamidsyj
	 XEC1lr1xAGJS5/Se0ozi0YLaJBZNslQG3GtopB0eBwDy2v+mbbuSG8LStQdj2I9yRa
	 R1Stg6GMlRXwy0rg67a2UIi/X+hkziWoBUnqT3ZDZNuTkzKPb5AAz4yuwG3sFRTin0
	 RiZ+JMy37eaMA==
Received: from [192.168.68.115] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B96F864DF5;
	Mon, 24 Nov 2025 12:51:16 +0800 (AWST)
Message-ID: <430d2ae7b148534ca6277c7066304e35a25ef682.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: aspeed: Add compatible for
 Facebook Anacapa BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Shen <sjg168@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley	
 <joel@jms.id.au>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, peter.shen@amd.com
Date: Mon, 24 Nov 2025 15:21:16 +1030
In-Reply-To: <CAJTz7Jd_fuTXpsseEE_161a7nLgoh4g9nH7M__HTsGihqNLQWA@mail.gmail.com>
References: <20251112211248.3711889-1-sjg168@gmail.com>
	 <20251118041058.1342672-1-sjg168@gmail.com>
	 <20251118041058.1342672-2-sjg168@gmail.com>
	 <c061ee38-5026-497d-b757-b0b9db2e6729@kernel.org>
	 <CAJTz7Jd_fuTXpsseEE_161a7nLgoh4g9nH7M__HTsGihqNLQWA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_205119_884737_39F0F4AD 
X-CRM114-Status: UNSURE (   8.96  )
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

Hi Peter,

On Tue, 2025-11-18 at 03:11 -0500, Peter Shen wrote:
> Hi Krzysztof,
>=20
> Thanks for your detailed explanation. I apologize for ignoring it earlier=
.
> I now understand the importance of Acked-by/Reviewed-by/Tested-by tags, a=
nd of
> not attaching patchsets to unrelated threads.
>=20
> I will follow the proper process from now on, and also fix my local b4
> environment so that generating the correct trailers works smoothly.

Can you please apply Krzysztof's tag and resend the series as v8,
separated from the v6 and v7 combo thread?

Thanks,

Andrew

