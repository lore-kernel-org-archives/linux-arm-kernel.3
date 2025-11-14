Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A213ECE7A9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sX+HOIylT+s1DfHSzoGBLyVtWwyxqB+zreyy1Q1PrXs=; b=0Me3as26cajWJ1gJsd2xgDP+Un
	DMLpxyUm7i5vTupB6rCA0tUWeymFg0WKeYJ9NLIneVURXl3Lm0mPO4QxYhedR0KD5ud8h0Nbt9BQR
	Vb7DALlGcZjtSaUXRlX1Gcb8tnShbA/4W6zOzY10okLXJf3CLJPVrxFqF0UGzjwV/vkpzMXlWDi02
	NU6zAVRiZtDxzqeKCD/5YUv05AtSuZDB/rETukA0x82cqWmQRXZyOq5geOH4XBuQWxIIh5eAg7jpx
	UX2UhT/FzR86IaRBsPJWMgJFIlwaWiOEu0FCjAdUx3jiuQ5HjhhCo0+J8HR4QjRMeqRRlC3hqaujl
	xgItkLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJq50-0000000BupK-149n;
	Fri, 14 Nov 2025 09:26:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJq4y-0000000Buos-3sZL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F39516016F;
	Fri, 14 Nov 2025 09:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5C4C4CEF8;
	Fri, 14 Nov 2025 09:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763112411;
	bh=sX+HOIylT+s1DfHSzoGBLyVtWwyxqB+zreyy1Q1PrXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oy12WodcEZ0xjE9jQd3zfg3IH6YfscOfbxRppFoSsNZW7bJyLB3pLIK5oT52nwSbz
	 FS8Apk088s5krjYBuc8/f3d4tJ0P8D9Glrx83vItqgS40sx+cCKT0djYA6HtQ122WE
	 XbsYCh1lI/aGEds70C/Y9jlamxM9HI8XbrTpHKiFue1WVgNsqqfSbRaQ1qiDNFwrgR
	 oqiY4wCvBF2CMR1LZzF4h3yt39zNIB2i2EhZaJZn/D23lRqDNx2MLq7c7uFNgoDb4Q
	 6I0JLax3LGu9aA3amA9aYnG12RbC7wYERUc0JHGM4Nnnpn2btIb2QywcmkxQafd+Ry
	 8y9x9CWfXYMnw==
Date: Fri, 14 Nov 2025 10:26:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, Roy Luo <royluo@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	William McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for
 frankel/blazer/mustang
Message-ID: <20251114-elite-refined-yak-bf9e64@kuoka>
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org>
 <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
 <00ea821c-5252-42cb-8f6f-da01453947bd@kernel.org>
 <CAD=FV=VSxeKgGcsRb9qiXq7nsbOWZjPvzmGEOhFA+pmABWdknQ@mail.gmail.com>
 <6490f20a-2492-4ee0-8f34-d529e0df0bad@kernel.org>
 <CAD=FV=Us7SU_OifVkS4mdfVhc=xGYSBiBpBk9aA1Ki0y+iYBpQ@mail.gmail.com>
 <abb77afe-c285-46ba-88ac-08574bd67712@kernel.org>
 <CAD=FV=VcAbgv41tjgWQN4i8Wqk6T6uvdpQ261Q_hcKM4AMpGEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=VcAbgv41tjgWQN4i8Wqk6T6uvdpQ261Q_hcKM4AMpGEw@mail.gmail.com>
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

On Thu, Nov 13, 2025 at 10:04:53AM -0800, Doug Anderson wrote:
> Hi,
>=20
>=20
> On Thu, Nov 13, 2025 at 9:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > >>> Yes, the complexity of just "hooking up" the components on an SoC is
> > >>> an order of magnitude harder than a Raspberry Pi, but it's still ju=
st
> > >>> hooking it up to external components. In both cases, we are modeling
> > >>> the core "brains" (the part that contains the processor) as the DTB
> > >>> and everything else just "hooks up" to interfaces.
> > >>
> > >> You mix the topics, so I don't follow. I speak here about bindings -=
 you
> > >> cannot have the that compatible alone, because it is incomplete, just
> > >> like compatible for "transistor" is not correct in that context. You
> > >> speak what could or could be DTB, different topic.
> > >
> > > A "SoC" is "complete". It has a processor that can run instructions.
> >
> > Then show me executing any piece of software, which is the consumer of
> > the bindings, and runs on the SoC without the rest of the hardware syst=
em.
>=20
> Show me something that runs on a Raspberry Pi (the models that don't
> have eMMC) that runs without hooking up power and plugging in an SD
> card. :-P

It has MMC controller/slot described in the DTS and the SDcard itself is
DT-transparent, meaning you do not describe it in DTS, plus I can easily
insert such card, thus for sake of this discussion that RPi still works
fine with DTS.

This SoC cannot work without other pieces described in DT, that's why it
is incomplete and unusable on its own.

You are right that my previous arguments of hooking components are
incomplete, so let me rephrase it - the DTS file should be complete from
DT point of view and completly usable on its own. That's why DTS
represents board (with the exceptions of few SoMs as explaiend to me
long time ago).

SoC does not meet this criteria, therefore it is not suitable for DTS.

And if you claim that SoC could be fitting DTS, then I claim that
individual transistor or one IP block like DWC USB3 could be there as
well. With your arguments we could create DTS files for DWC USB3 nodes.
Fact that transistor or DWC USB3 cannot execute code on their own does
not matter, because it is nowhere said that DTS represents something
which can execute code. CPU executes code, so following this argument
DTS could contain only CPU device nodes..

If we allow subpieces, like SoC components or SoCs (both still unusable
on their own), as DTS files we open the pandora box of all possible
styles and formats. I don't see reasoon why would we want it, what
benefits this would bring to the ecosystem maintenance.

We did not document it that DTS represents usable board, but it is
implied all over the software projects, like GRUB devicetree [1] which
takes one DTB to load. Only one.

[1] https://www.gnu.org/software/grub/manual/grub/html_node/devicetree.html

Best regards,
Krzysztof


