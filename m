Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF07109E54B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxhWMHFepKywPAMq9Te2gDIZ/jliERuXqPwuGoAzPdA=; b=Jcr+6MCos6ji3wBhFPxSLDdjfT
	T1G9EusBE+0cn1DyxkMrv7k25EfmKgFUDqbn1REtSrwMgbkY0F3DWzDO+BmYVqXEUw09I6XCVTCFA
	4uzovFh5sEiycUn5OHC/TYQnUSjI0FS4sSv6xaOBq3hZ3QmWN3SqcKZ778Puoe/oGYHfXKP3MGY9+
	LL8jwe9ODVqqCrqj4Ki/EkW7tjZfCiK/nMJ3lFFfNvVqcfoN1ojnAeN475M06OQqoyfVoGsJBY0qU
	KMpk8kI/3/IaBCzmILFEN866c14zO7q2b13W9JkXbIYC77sy4AkqWMHX2jA6xGEHVFo5XJzOy7NG/
	SdNPgx1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5co0-00000004hiT-2qrv;
	Thu, 26 Mar 2026 04:58:52 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cny-00000004hi7-2CKp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:58:51 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fhBPf4D4Rz9vLd;
	Thu, 26 Mar 2026 05:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774501126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FxhWMHFepKywPAMq9Te2gDIZ/jliERuXqPwuGoAzPdA=;
	b=CUpgs9+ejnB101tRLpVjERzxLuLazVIaiJGPmBE6II4OhI3xTCumKWo79MwzMbK/2IjN7g
	yQouTzhET74LJ1ghGzbwcNfNlIjHhFJY2MaHneWIejybtjd3Z0Kt6WLrBDhSArWG439f8a
	xlIxEPHzOFHBzIM27oBhZxQVWi997FeBR6CL8MHiur0s+xoPaJxpVJWjVi8JPQGrQxPsNK
	f3OWIbUZO58BXTsImGcGUAd3WHrtK51g4RDbK4u+5ggex+cP/F/nMzlGN4GrJdP/vnUI0e
	EGEWrLE3lu8pF/VRxpNBIZ18/D1b7TJrk9aUww99TbQinmewWc5Yoldt/n9hOg==
Message-ID: <32a1ea50-fca3-4eed-996f-e28be1908770@mailbox.org>
Date: Thu, 26 Mar 2026 05:58:43 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
 <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
 <CAMuHMdV_rGpnx6DzmdDgAsRJ4hXy8TP+pSnnzURjeGZfxB+5wg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdV_rGpnx6DzmdDgAsRJ4hXy8TP+pSnnzURjeGZfxB+5wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: oiep73o1fw1siypm6hp3uraph4r9gapd
X-MBO-RS-ID: 91a01d07383b74c17a6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_215850_739177_1A6C0DB5 
X-CRM114-Status: GOOD (  14.13  )
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

On 3/25/26 3:32 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Mon, 16 Mar 2026 at 13:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 3/16/26 10:11 AM, Biju Das wrote:
>>>> There is also Marek's older series ([1][2], as Marek doesn't do cover letters ;-).
>>
>> You seem to be commenting on a 0/4 cover letter here ...
> 
> Ha, the exception to the general rule ;-)

Hehehe.

>>>> [1] "[PATCH 1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on all
>>>> RZ boards"
>>>>       https://lore.kernel.org/20240630034649.173229-1-marex@denx.de/
>>>> [2] "[PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on
>>>> all RZ boards"
>>>>       https://lore.kernel.org/20240630034649.173229-2-marex@denx.de
>>>
>>> I haven't seen these patches.
>>
>> They are deprecated.
>>
>>> It does not cover all the SoCs/boards. If Marek want to take over, He can send next version
>>> covering all Renesas boards + binding change.
>> Isn't this series effectively exactly that ?
> 
> I believe we still have e.g. the KSZ8041 and KSZ9031 PHY nodes to fix,
> for both RZ and R-Car boards? Some of them were covered by [1] and
> [2] above.

I hope this is now all addressed by two board fixes [3] [4] and one 
larger fix [5]. But there are also other warnings on the arm32 side 
which are not related to ethernet schemas.

[3] 
https://lore.kernel.org/linux-arm-kernel/20260326045355.223529-1-marek.vasut+renesas@mailbox.org/
[4] 
https://lore.kernel.org/linux-arm-kernel/20260326045416.223556-1-marek.vasut+renesas@mailbox.org/
[5] 
https://lore.kernel.org/linux-arm-kernel/20260326045523.223620-1-marek.vasut+renesas@mailbox.org/

-- 
Best regards,
Marek Vasut

