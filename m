Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8A4D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 19:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQ3uT13n6qq7JkXGN76vfu9uM1WotpK8bIRwkXByhyw=; b=zZMll8++G7esNHH3xPsDMPDQBy
	03hNOn/ZkiAj8kcFYAFgGAG9F4TI+sDlRh2zqTd0Djxz/hFFdfSiLk+DTk4XkehEiEuYeB2s5opAQ
	DfbYsPZa5B7bdKGGLpyVD/fXY4qa3u9dsotq/XFcmkt/utQxw7HaLBdXdgAbqdGkZvwpj2GJO5HHK
	3C2I/RWjxJMCsWiq53zA2Lk4Qf01Subz0ak2vgkR5CcDUswmPMei/VnjLePf72n4tRB04NplL+ZEM
	gn6oAhuj7TuWo6Wc0MYvikKPaRYlxy70cnLs+1GlTnsGHyUlZfPT6d1rLrQ1dda+J4ZDrDOybycNL
	WSwyFxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPR0p-00000001lHY-2AXC;
	Sat, 29 Nov 2025 19:53:43 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPR0m-00000001lGw-1aaC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 19:53:42 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560+5C/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1764445987; x=1765745987;
	bh=MQ3uT13n6qq7JkXGN76vfu9uM1WotpK8bIRwkXByhyw=; h=From;
	b=hbJujqS6Ism7p3H8rRTZ68IE3mNac7tqLmvIL2l9Na3TfRMx4DmOECmVsJtPqzlVY
	 cTgIqYvqt5PJZ54Rr3P031LjRgRQOUbhM7xLsQDaEv9Kix6eZQ9oNNxgnU7igun29M
	 ibL801xOd7E4HtiKnuZQpDYXI6qip5W80YOH+s1xJndVCUN/ROyKwcoEEIt0e+AQ4s
	 GqUdzuNoUEP8WxiQt6JdJbUxzQhm+63LfjgSODijNKHWBmLnqqajXAuKn4dkcZGJwh
	 ZLdpUa+797t71bez1HjtAs6JxFE5Z5f/fHw88xeqj/oaLLgULyeNlHuBTmRTv61BL0
	 uK8E69NWw0rtw==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.18.1/8.18.1) with ESMTPS id 5ATJr5HC007466
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 29 Nov 2025 20:53:07 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 29 Nov 2025 20:53:05 +0100
Message-Id: <DELFWFLO1M8G.1AMPX0VKEOJND@matfyz.cz>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
        "Ulf Hansson" <ulf.hansson@linaro.org>,
        "Rob Herring" <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        "Conor Dooley"
 <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] pmdomain: add audio power island for Marvell
 PXA1908 SoC
To: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20251127190237.745-1-balejk@matfyz.cz>
 <20251127190237.745-2-balejk@matfyz.cz>
 <51c9408e-45e7-4ce7-9e95-6e0a45bcc8fa@dujemihanovic.xyz>
In-Reply-To: <51c9408e-45e7-4ce7-9e95-6e0a45bcc8fa@dujemihanovic.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_115341_010592_4041DDE9 
X-CRM114-Status: GOOD (  11.33  )
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

Duje Mihanovi=C4=87, 2025-11-28T22:30:55+01:00:
> On 11/27/2025 8:02 PM, Karel Balej wrote:
>> diff --git a/drivers/pmdomain/marvell/pxa1908-power-controller.c b/drive=
rs/pmdomain/marvell/pxa1908-power-controller.c
>> index ff5e6e82d3f8..e32eb227f235 100644
>> --- a/drivers/pmdomain/marvell/pxa1908-power-controller.c
>> +++ b/drivers/pmdomain/marvell/pxa1908-power-controller.c
>> @@ -29,7 +29,10 @@
>>  #define POWER_POLL_TIMEOUT_US	(25 * USEC_PER_MSEC)
>>  #define POWER_POLL_SLEEP_US	6
>> =20
>> -#define NR_DOMAINS	5
>> +#define APMU_AUD_CLK		0x80
>> +#define AUDIO_ULCX_ENABLE	0x0d
>
> I would group these with the other register definitions.
>
> Also, it's probably better to be more consistent with the naming, so I'd
> prefer APMU_AUDIO_CLK.

So would I, but this is how the downstream code calls it so my idea was
that it possibly matches the datasheet and it would seem preferable to
me to match that even though we don't have it available.

I could then do the reverse of what you say and call the other
definition AUD_ULCX_ENABLE but AUDIO seems nicer to me too and this one
is not defined in the downstream code.

What do you think?

