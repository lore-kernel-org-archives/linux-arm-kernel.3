Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B9BC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wmv4q5kslyW7LYhJvUJq2hJb6r93CoDTZkX0OsjJ1v0=; b=Yl4KFqOvYYurbIKFRNtQuFf5bK
	TOPgafHrUP5cAZzcKs3vF3p8Fpx9WQeB+LK/5B2KhuvEgt/SuefkkmdGfZ2XtxuKdWfvvjq5c5ARx
	2kFJW7YWjRytbgiUQ1MhaBTE6xDzmzSGuheXl4pKib/mExrGd7WhCyF5mUIuOxwisQF8TOUmWDtJZ
	nEtgDF2YDBHfLdENK+EUyz58gWTiUGdf/HRjbGZ02xEgbw7n9gJ0rdqvOztAOA+p5NIx2Vyhg39mX
	spllW6IyySN9Jcsxuymw1jPLQAhaO3n0Fs9vQAuylOd9A4g93nNR8dj0agTxZfiDTDGRI1+KnJou1
	5OaOB8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMFH-0000000CtBt-11zn;
	Tue, 20 May 2025 12:38:59 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMBo-0000000Csc9-0r3H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 12:35:25 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id A255FC405A49;
	Tue, 20 May 2025 14:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl A255FC405A49
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,  Martin Kepplinger
 <martink@posteo.de>,  Purism Kernel Team <kernel@puri.sm>,  Mauro Carvalho
 Chehab <mchehab@kernel.org>,  Shawn Guo <shawnguo@kernel.org>,  Sascha
 Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  linux-media@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
In-Reply-To: <20250509103733.GE28896@pendragon.ideasonboard.com> (Laurent
	Pinchart's message of "Fri, 9 May 2025 12:37:33 +0200")
References: <m3h61u9jy2.fsf@t19.piap.pl>
	<20250509103733.GE28896@pendragon.ideasonboard.com>
Date: Tue, 20 May 2025 14:35:18 +0200
Message-ID: <m3o6vn8np5.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_053524_402227_2FD5DB42 
X-CRM114-Status: GOOD (  20.20  )
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

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

>> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
>> @@ -654,8 +654,7 @@ static void mipi_csis_set_params(struct mipi_csis_de=
vice *csis,
>>       val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>>       val &=3D ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
>>       val |=3D (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
>> -     if (csis->info->version =3D=3D MIPI_CSIS_V3_3)
>> -             val |=3D MIPI_CSIS_CMN_CTRL_INTER_MODE;
>> +     val |=3D MIPI_CSIS_CMN_CTRL_INTER_MODE; /* enable filtering by DT =
*/
>
> The condition was added because the CSIS in the i.MX8MM doesn't
> implement the INTERLEAVE_MODE field. We can't remove it unconditionally.

Is this confirmed (and not just an incidental omission from the docs)?
Same version (3.6.3), and even earlier version (3.3) has it... It would
mean MM can't work with those sensors producing extra packets.

I wonder what version is shown in the #0 register on 8MM (8MP shows
3060301).

> You mentioned i.MX8MP, that's a platform where I'd like to see proper
> support for *capturing* embedded data, not just dropping it. Have you
> looked at how this could be implemented ?

I had a brief look at it, but a) the embedded data is not very
interesting in case of my IMX290, b) I don't want to interleave it with
my image data (DMA buffers and what not) and I don't see a way to store
it independently.

If you want to store it along the image, the currect code does that -
more or less correctly. This is the problem.

The RM says "13.5.2.6.6 Null and Blanking Data
For both the null and blanking data types CSIS V3.6.3 ignore the content
of the packet payload data." which is half-truth, e.g. it needs the
MIPI_CSIS_CMN_CTRL_INTER_MODE to do that, otherwise it messes it up.

Several CSIC registers are named XXXXXn, suggesting more than one
register, but the docs say only #0 exists. Nevertheless, the actual
hardware seems to contain 3 packs of registers (the 4th one is weirder):

32E40000:  3060301     4705    F0000 DEADCAFE
32E40010: FFFFFFFF        0        0        0
32E40020:       F0  900001F DEADCAFE DEADCAFE
32E40030:      1F4        0        0        0
32E40040:       B0  4380780        0 DEADCAFE <<< ISP_CONFIG0
32E40050:      8FD 80008000        0 DEADCAFE <<< ISP_CONFIG1
32E40060:      8FE 80008000        0 DEADCAFE <<< ISP_CONFIG2
32E40070:      8FF 80008000        0 DEADCAFE ???
32E40080:       B0  4380780        0 DEADCAFE <<< SHADOW_CONFIG0
32E40090:      8FD 80008000        0 DEADCAFE <<< SHADOW_CONFIG1
32E400A0:      8FE 80008000        0 DEADCAFE <<< SHADOW_CONFIG2
32E400B0:        0        0        0 DEADCAFE
32E400C0:        0 7FFFFFFF        0       E4
32E400D0:        0        0        0 DEADCAFE
32E400E0: DEADCAFE DEADCAFE DEADCAFE DEADCAFE
32E400F0: DEADCAFE DEADCAFE DEADCAFE DEADCAFE
32E40100:     22E1     22E1     22E1        0 <<< FRAME_COUNTER*
32E40110:        0        0        0        0 <<< LINE_INTERRUPT_RATIO*
32E40120:        0 DEADCAFE DEADCAFE DEADCAFE

This is the first CSI. The 3 frame counters are visibly active as well.

The manual states (MIPI_CSIx_ISP_CONFIGn) "NOTE: Not described types are
ignored" and even if not, I can't see what could we do with this extra
data.

Perhaps the CSIC internally has 3 output ports, but only the first one
is connected to ISI and ISP?
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

