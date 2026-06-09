Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAD9CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLyB8XawH2sgIIZ5MIGWnJ1sq7S1TgdTUSfQDubvnvY=; b=u4YO6gkVolBtH1CcbDesOFy49z
	txkzeFboU7FfNP2HoMfiuYyJKPkLSbqqR91csMCdMV9lu53MrHnJpUCxgZ4pCoUFXZGWWc1pcArN6
	lP0GSMRgnf+cYBcEmQ42eaZ7gz4gvz6RjEdv8v4N4iRstjDGw00UKOHzSq2ns2YA7mkRaUmgPS52C
	954TzoHVeYODlp+alt0CkuS14m/9FWsdStl8cUCgRls9NmE51f3OB4z8a1Ju6zES7CkTeeLe+ay0Q
	AJ5IENf4i2q2jyelRJrWGu1hUO/IJnnvsz1l1s4Nu0qhUkADHZMAz1hLQd3PHFpP4m9C6FC+jOdP+
	/C9HvQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1vW-00000006GZW-1hr6;
	Tue, 09 Jun 2026 19:15:54 +0000
Received: from mail-106104.protonmail.ch ([79.135.106.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1vT-00000006GY5-2hSj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 19:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1781032548; x=1781291748;
	bh=dLyB8XawH2sgIIZ5MIGWnJ1sq7S1TgdTUSfQDubvnvY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jxZ8lbzXdWYig6RBNon62GlCSUWxQT8YgWPOGrQicRm1+BP4F6N1vmbOsYU2Mf6Jg
	 aJHhD77bzauCDH34ogxqUaD8PHf+9PtL2fo6qgpBpwtuMhHfWA7kZMj4ozOSkoh/X/
	 L3jmVZQ1JnSp3vUJFiP6sqSSmpvPjUsR04kvLBfPTGNp/e4oT0FQwcIObd5vouo9hN
	 ZrWdB0hgOK+fwTNA3vRUqr9CsiUmc5zbP9ZwKxyK8Vt1m7tXr2sQnrfELoGXIVHWJe
	 Ic68gU5gkwaRChhxc3HO2DwlcXXA/qE/mRDopRlf/ZjpwVvciYM983aQZAxDJI0uiH
	 uLYUKLEuxvytg==
Date: Tue, 09 Jun 2026 19:15:42 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC driver
Message-ID: <hacDZbv1Whk_g8AMSfJqKHrgXfyVKt2o3_UGK-1k9jNRJyMxEFPztGhytHvHbc1x9j-F84I_ZuprmXWf2Azbtdqj2vnVal4PO1gG_DijYyA=@protonmail.com>
In-Reply-To: <aihbxowyAIlSeDjH@ashevche-desk.local>
References: <20260609-mt6323-adc-v2-0-aa93a22309f9@protonmail.com> <20260609-mt6323-adc-v2-2-aa93a22309f9@protonmail.com> <aihbxowyAIlSeDjH@ashevche-desk.local>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 254bdc277eca4fcbf59a132a374d5de774ac7810
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_121551_848737_09080617 
X-CRM114-Status: UNSURE (   8.27  )
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

Hi Andy,

On Tuesday, June 9th, 2026 at 9:30 PM, Andy Shevchenko <andriy.shevchenko@i=
ntel.com> wrote:
> On Tue, Jun 09, 2026 at 04:31:59PM +0300, Roman Vivchar via B4 Relay wrot=
e:
>

...

>
> > +=09ret =3D regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19, val,
> > +=09=09=09=09       !(val & AUXADC_ADC19_BUSY_MASK),
> > +=09=09=09=09       10, 500);
>
> It's better to split on logical boundaries:
>
> =09ret =3D regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19,
> =09=09=09=09       val, !(val & AUXADC_ADC19_BUSY_MASK),
> =09=09=09=09       10, 500);
>

Agreed.

...

>
> > +=09case IIO_CHAN_INFO_RAW:
> > +=09=09scoped_guard(mutex, &auxadc->lock) {
>
> I'm wondering why we haven't moved to guard()() here

The compiler would complain about 'cannot jump from switch statement'
due to default case.

Best regards,
Roman

