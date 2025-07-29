Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79286C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References
	:Message-Id:Date:Subject:Mime-Version:From:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYSV2StNUOZy7KDwHEwZQfIF6jGVbbmQm90HDTnMUfA=; b=RXMPSz8ej0BfTAJYJ46Rre5Um1
	sNw6a5NYjoPHuI2GMTiSa7LAvCji0wUEOYDTkVnhjb3OjH4W/dB4mUy4/Ub+tbVg0dRAA0YQubYRa
	BpzCg9WQ1W7nrHskVGrATM/MhuGa2OtakPKocSdLUQ16DELRA/rGfEWLQuu0r6+2OR88ATvB4otVb
	90blKn42B/WeKy6JKHPBhgoSD0H8LxP+8Plj4BMyRVY/Y9ubgmWnxwiOiXZhUY5n4ohvd6AL3Q5+4
	ZKpvQ3zhXhy0bH2QwJ/Wr2zYJ9MMPhiNCu/RigDQ/H8BVYJSHmZKqBG+49Y13xnNyYtp+zPtN+k7n
	FF6rfEPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggoO-0000000GQ7S-1NzE;
	Tue, 29 Jul 2025 09:39:56 +0000
Received: from chumsalmon.baetis.net ([209.222.21.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggVL-0000000GNRR-1Zue;
	Tue, 29 Jul 2025 09:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753780813;
	bh=SL47x8RSPgb9O9GPSLVDnHkRq6js7JXYM272pZ+IYJ4=;
	h=From:Subject:Date:References:Cc:In-Reply-To:To:From;
	b=EFcSmrnQQ8ni8XA9Or5AqCO4mhm5tLNtScnVIinhQinQ1XeA23f2/+eyTbEe1U0zO
	 fTBXZqqfAfaIofhZnpPu2L8zkC5Oql8rxLJMgtbNqvmn6AZRey5ipVsIaIkxmTxSWX
	 htcc33V1Hv51luA9appWghQ35Jj5d9GiExox+S8CKh501JJDfKuhjYq4+kgtAIHYec
	 fSL0GeLljntcRhfnx4iAG4ATtjAFkKZKlnXuHa0slY7Y2If4AUf2q9p28fcQ85vOrE
	 aUyLf9k5r3cwBgDlaoy5PoXbcrcFKFTVfqbjyBjvsJptI8cMMB54g+mbYbmgY80fcS
	 nuJtonwhT7IGg==
Received: from smtpclient.apple (unknown [IPv6:2600:4040:50b7:b604:2ca9:1ceb:f1ef:b736])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 4C83B27E434;
	Tue, 29 Jul 2025 09:20:13 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Erik Beck <xunil@tahomasoft.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v5 0/2] Add Support for LinkStar H68K board: ARM64 and RK3568: dts and dt-bindings.
Date: Tue, 29 Jul 2025 05:20:02 -0400
Message-Id: <1283435E-EC3D-492E-8369-E51CBFE5E636@tahomasoft.com>
References: <20250729-poised-proud-ibex-5ab838@kuoka>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250729-poised-proud-ibex-5ab838@kuoka>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: iPhone Mail (22F76)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_022015_607375_4DC4108C 
X-CRM114-Status: GOOD (  10.45  )
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



> On Jul 29, 2025, at 04:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>=20
> =EF=BB=BFOn Mon, Jul 28, 2025 at 11:07:35AM -0400, Erik Beck wrote:
> v5:
>>  - Responsive to comments received from  Krzysztof Kozlowski <krzk+dt@ker=
nel.org>
>>    - https://lore.kernel.org/all/20250728-dashing-discerning-roadrunner-b=
c8b87@kuoka/
>>    - https://lore.kernel.org/all/93c39b36-07c8-4883-bd23-7d0194c50a7a@ker=
nel.org/
>>    - https://lore.kernel.org/all/642df1ee-5e92-4f0a-bcdf-7e10dbc0d59b@ker=
nel.org/
>>    - https://lore.kernel.org/all/9ebd9797-8d92-4799-bb8d-59a796e6043c@lin=
aro.org/
>>=20
>>  - Changes made are:
>>    - Revisions to commit messages:
>>        - Removed notes on base commit;
>>    - Fixed checkpatch warning;
>>    - Removed notes on device history;
>>    - Fleshed out the top-line summary of the dts patch;
>=20
> You did more - also changed order of patches.


Oops, sorry about that; I struggled a bit with b4.

Which order do you prefer?

Thanks,

Erik


>=20
> Best regards,
> Krzysztof
>=20

