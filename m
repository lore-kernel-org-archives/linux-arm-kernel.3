Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3364BCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJGBCui9T7s9JULkvZa2s1Wi4QfFt1yczMpraKYJAME=; b=pXHRQy9kchcHS//QVeR5oGePqA
	nBsfoKjbEpOYvoptg566rCK4vRvmnUEslum7IWTwWmPdQPBdzT2rdoT16YCoPf5xUOWFXRlT1bxeK
	5u8M9GsKqwUSOX05AlyGtsL+KzBHH+sHQvUbt36mu1IjV9jq2caRnSnEZ8Yad2ht/P3ZDz0X7jgxl
	rJevYFluJUM6t85GRLFMns5l9xpGmCxV13YwSXgQ+7PI27GG6xLuPJHS+C+Mil9QRx5sYQRauX6k1
	2AAVkaAyNRAHKKyYoIrPQn0UrTqto4+ZJU8Qe6pY/rSZlrnnYFcHckV+itWjEU9n0Ez4RY2/2TORb
	51Ihufrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTIT-0000000EhCQ-3JA5;
	Mon, 27 Oct 2025 19:54:29 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTIQ-0000000EhBe-15PA;
	Mon, 27 Oct 2025 19:54:28 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1761594862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJGBCui9T7s9JULkvZa2s1Wi4QfFt1yczMpraKYJAME=;
	b=C0xNo0EFD6UEQdlWe0ijdWjenik7ULzrIRTSe20MEiLs+pXDBzYjh2kgjj67gd8uIBZUXj
	Z0bFrzY7O7rChk/7aI2P3bdi1GmBIVG+36rn78DBrnu3Wp5R0NAJWGLoVEQuJDlUHhAK0k
	3FJu7W02FH2rDhWcwdKYAaSo+PQSW/7kJGYySM3mDexxDPxKhDWfVHXjHYy5zy5xHVlFN0
	EulFcXVM23+s800M7vtbRCg/y6WZMaoVXYJE4JNO/F3/95QrcPLT2BbBmvL8YF+3YOo7fM
	CjxYhkgu7N7BoxtEk7JN+QUpBw2ei2u1FUp1Ncx3Ijprz/3Kjo9xh3DyuhR6WQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 20:54:17 +0100
Message-Id: <DDTD9DGY2LEK.1XF49J28I22SZ@cknow-tech.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Dragan Simic" <dsimic@manjaro.org>, "Johan Jonker" <jbx6244@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>
Subject: Re: [PATCH] arm64: dts: rockchip: Harmonize regulator formatting
 for Pine64 rk3566 devices
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Heiko Stuebner" <heiko@sntech.de>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
References: <20251026153805.107774-1-diederik@cknow-tech.com>
 <DDSFVM1TXN8C.3JNX2M8XX04IF@cknow-tech.com> <5054965.31r3eYUQgx@phil>
In-Reply-To: <5054965.31r3eYUQgx@phil>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_125426_774696_76BADFBB 
X-CRM114-Status: GOOD (  15.76  )
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

Hi Heiko (and Dragan and Jonas),

On Mon Oct 27, 2025 at 5:46 PM CET, Heiko Stuebner wrote:
> Am Sonntag, 26. Oktober 2025, 18:44:42 Mitteleurop=C3=A4ische Normalzeit =
schrieb Diederik de Haas:
>> On Sun Oct 26, 2025 at 4:37 PM CET, Diederik de Haas wrote:
>> > The regulator node properties in Pine64 rk3566 devices were formatted
>> > rather inconsistently. To name a few:
>> >
>> > So harmonize the formatting by making all properties sorted
>> > alphabetically/naturally. And harmonize the formatting of the
>> > 'state-mem' nodes so they all have a preceding blank line. While at it=
,
>> > also fix 2 incorrectly indented nodes.
>
> Originally, I always liked regulator-name to be on top, identifying
> the regulator, similar to how compatible works.

That makes a lot of sense to me and I had actually thought about doing
that. But I didn't have a justification for it, while referring to the
DTS style guide is a justification. My annoyance was with the
inconsistency, so consistently putting 'name' on top would be fine too.

> The other issue with moving stuff around is, that it makes it harder
> to follow git history, because git blame then reports the sort-commit.

Then it's not worth it ...

> I guess it is ok for individual files, someone does take care of,
> like Diederik for the Pinetab, but please don't start resorting all the
> existing devicetrees :-) .

... and I'll file it under PEBKAC.

Cheers,
  Diederik

