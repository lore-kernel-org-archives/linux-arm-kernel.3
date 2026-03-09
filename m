Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856E8FCA17E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 19:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqSEwB6ftB6EChAdYtUSEYjrVcG+vsVX3U1TnmfLdZE=; b=LKG3GQJs1ne9v86F4vfx0dglP3
	lc9fUtUXPbqBazQKt6vbW6lHGAgnsCPmnm6IO1qQQeo7DCoYAUwriZrwLG6zaO4YFbw+jmnba5XrA
	nMxbnQL9DfrK/MXTaFA+b3j9e5U2sVBG4DcYI17XEf9zyzm++n3CCDI+okaM0+Mmh6elpmM8a290a
	5prtuYxP6unKkct6l8yDlIV+BqIlJgALc9YhMWxxBpoNOKYHY8q9dRcVhzZCSUgJnQ/EeSypuBjA5
	6MqbSwk9AfhTysDYUrQL7sXWpXSQh6kViJYDebbQtwKPJbijfWz7bYg4jhnjSwmwIOJdVf6G61U5Z
	Bubbm1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgTH-000000084UN-33xO;
	Mon, 09 Mar 2026 19:40:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgTF-000000084TN-0inS;
	Mon, 09 Mar 2026 19:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=TqSEwB6ftB6EChAdYtUSEYjrVcG+vsVX3U1TnmfLdZE=; b=D+Tb9Ckm3akoSkL/fOwXmDknrd
	NU3bx2vX9RW2gSfQNPT61jNCz2IYx6othdpqaycogPnwHqhkNtqjlR5tnB6Pn3+vvIm/0uZqY+5UI
	U3pVwNRRE7Lj2VKGlq+HiPCKSROJCC3pyBKqiaif5nSNODbcRcReIQFlFcMWU6TlLFiy1Gihl1Y8s
	9xXzTEl+VEH2gbI1pSMBFurZb/SvbaboxcCSuwVrxEITTTLIH6oLVv8SifuQiUm8iabS0dR7hPM3E
	+qcpGaluXDqKLy5jxYjIT/hbHW0ZU/MJCKcRmwaGUzDok8MR9+Rfm8lKItnVuMfJsTQ6BOnFVZNYk
	uGYvoKcg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: jonas@kwiboo.se, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
Date: Mon, 09 Mar 2026 20:40:40 +0100
Message-ID: <1996728.taCxCBeP46@phil>
In-Reply-To: <CAOMZO5CNB25j=JoK6C7CGsXFq5Vg2j=nfrbaL163qjeWYa4J5g@mail.gmail.com>
References: <20260216010219.2131484-1-festevam@gmail.com>
 <CAOMZO5CNB25j=JoK6C7CGsXFq5Vg2j=nfrbaL163qjeWYa4J5g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_124053_291971_4D27DB2A 
X-CRM114-Status: GOOD (  11.67  )
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

Hi Fabio,

Am Montag, 9. M=C3=A4rz 2026, 15:57:17 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Fabio Estevam:
> On Sun, Feb 15, 2026 at 10:02=E2=80=AFPM Fabio Estevam <festevam@gmail.co=
m> wrote:
> >
> > From: Fabio Estevam <festevam@nabladev.com>
> >
> > Add the PMU GRF and IOC compatible strings for the RV1103B SoC.
> >
> > Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> I'm sorry to bother you, but can you please let me know if you are
> happy with this series?

At least the uart compatible "rockchip,rv1103b-uart" is not yet visible
in next [0]. Last I remember, you were asked to re-send that binding
separately.

Similarly, please also create a binding patch for the watchdog [1].


Heiko



[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml#n20




