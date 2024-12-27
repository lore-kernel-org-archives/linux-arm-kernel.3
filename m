Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B42E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWGtyTFJgaJffoNbyeoot1oowobuuGFBuEE706eXXAY=; b=smpwhgWkYZ8kyHIZ/MS+A1O1gV
	KiRewIdZ6XEMuyAlryE+P40pU7001WMTrAFSb9TW0oMv4g4zSg3uX8T/FIffFk/JHNBMhYSF9bH9u
	OFs1o8gpJZKIb9XEX8+OersCA5A7oVrvrn6N5YHVVppyRvYLngXpm69GWOQUkVxKHhmWiiXItUejz
	au9XArdX8sgef6DA+niKAadWhco+h9Kd8VVydMb2fjhelE1neh8spnPY/3hy+A67STqnrRgqwBPdv
	ytpfPY3sOWgw0GxiKfWX6YNqCFkPsRYwks+8YFAfbvHc7uQUIGKGbBxRv02S6JcqNb2oyDENoBe0g
	NPnVDtpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR50k-0000000HI2f-3jRF;
	Fri, 27 Dec 2024 07:43:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR4zJ-0000000HHhk-3ZzT;
	Fri, 27 Dec 2024 07:42:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 347DCA411F6;
	Fri, 27 Dec 2024 07:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F12C4CED0;
	Fri, 27 Dec 2024 07:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735285344;
	bh=gWGtyTFJgaJffoNbyeoot1oowobuuGFBuEE706eXXAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMZoBBxNRZ0HOYa16X5nrRft1gmuBLRNSQgDrV8mr48hlue8N4A48mECoBrQ6KqBj
	 cSOJwgelgfq6mTKLp3qsdvDeMOfPsIahlt8Kq4SuM1h+QzBaIYkT+/zJst9gsaj6KL
	 RxhaEIvh9VR/4xCFmD76gyFYjnTzxNKKx2Rd/RLWwDcYl53SVfOAj3wHGSxQgh67+Z
	 T89Rbc0BTNLGXmSFKJQYIGzVrNaLf6kxVUHtbqjXpvIQ2RfHFsrWJu0C5DhR4fpfiC
	 2Mbib+jRsaJ3YVrfekxhzc9Z20Lxu9h3KCvFNA5y3h/u0DdEHuvPg+G8rPezsk1Ys+
	 LgJypTgfPDK5A==
Date: Fri, 27 Dec 2024 08:42:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Kever Yang <kever.yang@rock-chips.com>, heiko@sntech.de, 
	linux-rockchip@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/17] dt-bindings: pwm: rockchip: Add
 rockchip,rk3562-pwm
Message-ID: <xq67rd3a6yeie3kajdnzufbxctqxmv2h3ufhqauoqmxe3hk2oa@vnru4lmtpkm3>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-12-kever.yang@rock-chips.com>
 <qvr7x4anlxxtpxjywrqjihxyxejw4i73wrh2ibl3hasayew4s2@obyuxce4ez4g>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <qvr7x4anlxxtpxjywrqjihxyxejw4i73wrh2ibl3hasayew4s2@obyuxce4ez4g>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_234225_959915_614591F0 
X-CRM114-Status: UNSURE (   9.67  )
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

On Fri, Dec 27, 2024 at 08:24:15AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Dec 24, 2024 at 05:49:14PM +0800, Kever Yang wrote:
> > Add rockchip,rk3562-pwm compatible string.
> >=20
> > Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>=20
> What is your merge plan here? From my POV merging the pwm update via my
> pwm tree would be the easiest. But if you want to let it go via (say)


No clue, but we already provided feedback this is supposed to be split
per subsystem. Not much improved.

Best regards,
Krzysztof


