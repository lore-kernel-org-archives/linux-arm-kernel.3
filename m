Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B03D40D13
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 01:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEmxSq/NkKz6iT/Dgl0YFzKvSZceJY3WcBKagBh5G0o=; b=DUOWGotP6H8UtgnbpG06An5GsV
	a6tbDA9+MXiaJH13/dzdx0wHWG/uKgWJNFzDA9WtutTBaWTbo16tiWn32oa01y1sYhevUx/AC3F03
	MgutC92KSIijGx6wC5GqhqzL3QszbB0ztWyDoY9tpZR+HOH4FkkhjLGpKYQV0Ps+CsVA+fktBYGwr
	Z8Xv2OMEdL22dqgc8kLipYnsTYnpC75KWoh4U2IbEWf0dVfk4aZNxpG7kdPj/vOs07mvRLsuMg0AL
	tHS2OXy2PInqJIfDiCy7xZhOb0CdhEeD+hIwL5Ue1sxsuBZW322SLf/+/mJTQl3E0XSMOlxscoPGC
	ebGlYqmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8USv-00000001Gmt-1L4S;
	Wed, 06 Nov 2024 01:04:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8URD-00000001GdI-3Ici;
	Wed, 06 Nov 2024 01:02:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3F26A4186C;
	Wed,  6 Nov 2024 01:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFB2C4CECF;
	Wed,  6 Nov 2024 01:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854942;
	bh=BttNn7lXrePS44BuRpIBKpxxgxgRnihX4x4/xHR5B6Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AJkhPL6uPdCqeqLuI16M5ep55k+r1gEdp4rhIPV6b8lwChZZ37QjqZWZFkCvYqZWG
	 TJt4Sa11pwClk4YiXMa5fx++QF/15BSgSHjQqyBmRvLKoPScvWP7U7HSS/JnkSGfwT
	 plXEFvqg25WJU/YMCrLr7zhf6bFVUpGidHP1SYjc6nJL+htaY+aA/Zh8AgkVYxj60O
	 s6JB+mm2qozmb1cLk35Wi/nCamezdirmc6CTR8LBsy9gV38Va3PoSu1uOP3bOJJ4/g
	 l26DlJXx9dizk9H1Zxu9/22+l/8tm75gYW5aeZ5eUiF+IUnbqlE/auPfHFMDjDa0G2
	 9YM3JqVbSJZrQ==
Message-ID: <b6a264f8175f7c825b97aed63fb277a9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0198082e-19a2-48e8-ada1-a7edaeddb73c@gmail.com>
References: <20241104153108.3053932-1-ivo.ivanov.ivanov1@gmail.com> <20241104-lend-lark-ab46a268213a@spud> <0198082e-19a2-48e8-ada1-a7edaeddb73c@gmail.com>
Subject: Re: [PATCH v1] dt-bindings: clock: actions,owl-cmu: convert to YAML
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Date: Tue, 05 Nov 2024 17:02:20 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_170223_929860_EE74E161 
X-CRM114-Status: GOOD (  11.45  )
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

Quoting Ivaylo Ivanov (2024-11-04 12:19:57)
>=20
>=20
>=20
> On 11/4/24 21:03, Conor Dooley wrote:
> > On Mon, Nov 04, 2024 at 05:31:08PM +0200, Ivaylo Ivanov wrote:
> >> +    soc {
> >> +        #address-cells =3D <2>;
> >> +        #size-cells =3D <2>;
> > FWIW, you could drop these two if...
>=20
> I see, although the point of this was to keep it the example as close
> to the original usage in s900.dtsi as possible. Anyways, if a v2 is
> needed, I can do that.

Please resend with the fix.

