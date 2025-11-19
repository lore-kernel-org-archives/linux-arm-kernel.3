Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8399ECF258E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4MyhiUrRVJoFNGk2D4bpUeiUKWMgtxnDIhB2j6Wz40=; b=3Zz2LrvjN7WQUa3yxY7w7NP8zX
	AsHWQwOH5ZOlwwEcb5Fv0+1v/a7WWpk+JL4+r9cKPt/gGxoBUYWTyRc3aQD/UNZRLitvtaYx+UAvO
	KIe3Gy3ljRAIV4hyl63V/Sn7e5pZotFEfKZDrWQwpIL9QkY58niSxfVEn0Mz5llO9tboHE5b6cTpX
	udmY28/W/RZNth/SE0CWypLYSThz02RL3sBM3UaGgBxvp4uUvKaaEyJbYgvketLErh9pVBQSEqgjo
	BMqEzqvgNvU+Jr2gfdI2zj/VIwXMTQiPjx2dKewi9eBdvOBTMurw1ytash3uH12dy88Hc+ogbaHNJ
	94RLFXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLccT-00000002hlZ-2RCs;
	Wed, 19 Nov 2025 07:28:49 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLccQ-00000002hkv-38dr;
	Wed, 19 Nov 2025 07:28:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id C25E54103E;
	Wed, 19 Nov 2025 08:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763537324; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h4MyhiUrRVJoFNGk2D4bpUeiUKWMgtxnDIhB2j6Wz40=;
	b=EcsPZ0hM4pFqxttaBdH9EvxyMJnbZvzyZyp9mNtz212SHspBhfRhqUIQWSkXCzOLtBjCeM
	ZwacH1LDlOPxxEae8HtZ8AX/gd6V+8mTVQct3ZUm5yTh8fwKe3Ser1lvSZ2PNxzqN9Cwmt
	37CKvcAdhagZtstAzXwyo1MZPaA7v11abSVAfZuJALMPM5Pug5oD5u4Poa9z0fACmGCuLy
	NEvRLHHiODf/s1TrbLWHkl7QRUk/PJ4IDxX35X38pls3SdipUcCh1jW67UWpRkfal4CFWP
	ay0c0tHfscXICGgzHSyuAb/kEvfUbVgAVR6pZCl8icA7bWWsVxkrNd7Zv8Cc3A==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <8fce39e0-62f7-4a79-83b8-e3a63af10e2f@rootcommit.com>
Content-Type: text/plain; charset="utf-8"
References: <e4cd11d0-463c-e707-5110-6b92899b1ba3@manjaro.org>
 <0c224662-b3c2-4075-8b68-c0ae27421ba8@rootcommit.com>
 <3c96ee6b-dca7-1a0a-792b-f8c165ec997d@manjaro.org> <8fce39e0-62f7-4a79-83b8-e3a63af10e2f@rootcommit.com>
Date: Wed, 19 Nov 2025 08:28:43 +0100
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Message-ID: <3d5ed2bc-038c-0808-56f3-411652b5ed6d@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/2] =?utf-8?q?dt-bindings=3A?=
 =?utf-8?q?_arm=3A?==?utf-8?q?_rockchip=3A?= Add Asus Tinker Board 3 and 3S
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_232846_942771_E71B3B99 
X-CRM114-Status: GOOD (  15.08  )
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

On Wednesday, November 19, 2025 08:25 CET, Michael Opdenacker <michael.=
opdenacker@rootcommit.com> wrote:
> > This should let us keep the "asus,rk3566-tinker-board-3" compatible
> > in the new rk3566-tinker-board-3s.dts board dts while satisfying th=
e
> > validation properly:
> >
> >    - description: Asus Tinker Board 3/3S
> >      items:
> >      - enum:
> >          - asus,rk3566-tinker-board-3s
> >      - const: asus,rk3566-tinker-board-3
> >      - const: rockchip,rk3566
> >
> > I'm quite busy at the moment, hence my delayed response, and I also
> > apologize for not running the checks on the above-proposed solution=
,
> > but I think it should work as expected.
>=20
> I actually already tried this, but it doesn't pass "make dtbs=5Fcheck=
":
>=20
> arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dtb: /=20
> (asus,rk3566-tinker-board-3): compatible: 'oneOf' conditional failed,=20
> one must be fixed:
>  =C2=A0 =C2=A0 ['asus,rk3566-tinker-board-3', 'rockchip,rk3566'] is t=
oo short
>=20
> The "enum" statement seems to mean that there is at least one of the=20
> items, which is not the case for rk3566-tinker-board-3.dts that doesn=
't=20
> have it.
>=20
> So, my V3 seems like the way to go if we don't want to duplicate entr=
ies=20
> in rockchip.yaml.

I see, thanks for the clarification.  Then the v3 is the way to go.


