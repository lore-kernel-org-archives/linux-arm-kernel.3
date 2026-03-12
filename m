Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFAA105A596
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 13:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FnYFmCxZYwPc2fULsPojaf0ZhhDn/setXz44tGs4pM=; b=bYTzicameNRm1b4x8AUPosqsAw
	gboS1VIX0rstRoIRP+L75mO3XbQN2sjWc4jrnea54GTmJzWbByUJT/QZ/UcCwo7ymSt1/Iwa82fKF
	sFCoTlpC/DSDB4oXOZqcd9LQHtbCLmACHh/v3bJfRt7GVgS1jquknwm0oKqGcSsxUVaTUDXyduOme
	7OBOYCAgfhuVBja/IKlnOqK2M6s/OG7S5b2gTM3MoWSl/Bo5f5jZe5yMVGYpEsCxmq6Q85ZUC5YtL
	csXsFHj582xtJ1Qao67oUfi+cYB0WXUmYMuF9DbbL5/SbTZ1IBrsheDqQcKoWZBBMHrivN/avnWlS
	0EvOblsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fe0-0000000E5s1-2sUC;
	Thu, 12 Mar 2026 13:00:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fdx-0000000E5rI-1JuC;
	Thu, 12 Mar 2026 13:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE25D4022C;
	Thu, 12 Mar 2026 12:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B268C2BCAF;
	Thu, 12 Mar 2026 12:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773320398;
	bh=jnqnQKwftHtCIfpSHfz7acIeHazHEgJ0xJKgKEXMU7U=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=XQMzh00lPdskzeLywViKrxB7WK8P+wSnNIq+7/aXGXxRnb3hDcyJ4SVkWXEP/ZX85
	 Vi18/OQ/R/4oU6m3kinwsrb57nLtCm6R2dQPZs+aLFdRgdCGbaivG612r1xLQxG4Z7
	 Yz83Pu9m/TgSzzvVdREhz8y/9a0jb69riAot+RrSud63yjwnXULTF1nF3HDvSCqRSp
	 7UlxhMe3zOOev9XKvfGeMazvaQtaK9bL6dPeUMpaVzdJn5q1Etr0xUIs7vfG7oqM7l
	 Wv56pSWmJFCrJrZg0quoSc908cMAy89sxAPQSe/8kCfIBs69iHoijTQOGSa9e4XX+0
	 6t7swwrOHVLew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 13:59:52 +0100
Message-Id: <DH0TM60TVX5D.20W4O1X696ALA@kernel.org>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Cc: "Manivannan Sadhasivam" <mani@kernel.org>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@oss.qualcomm.com>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, "Niklas Cassel"
 <cassel@kernel.org>, "Shawn Lin" <shawn.lin@rock-chips.com>, "Hans Zhang"
 <18255117159@163.com>, "Nicolas Frattaroli"
 <nicolas.frattaroli@collabora.com>, "Wilfred Mallawa"
 <wilfred.mallawa@wdc.com>, <linux-pci@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Anand Moon" <linux.amoon@gmail.com>, "Grimmauld" <grimmauld@grimmauld.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>, "Lukas Wunner"
 <lukas@wunner.de>
To: "Robin Murphy" <robin.murphy@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
 <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
 <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org>
 <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
In-Reply-To: <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_060001_438373_D7F1A379 
X-CRM114-Status: GOOD (  10.25  )
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

On Thu Mar 12, 2026 at 1:48 PM CET, Robin Murphy wrote:
> On 2026-03-11 9:09 pm, Danilo Krummrich wrote:
>>  From a driver-core perspective I think we're rather limited on what we =
can do;
>> we are already in async context at this point and can't magically go bac=
k to
>> initcall context.
>>=20
>> So, the only thing I can think of is to kick off work on a workqueue, wh=
ich in
>> the end would be the same as the deferred probe handling.
>
> Hmm, in fact, isn't the deferred probe mechanism itself actually quite
> appropriate?

Yes, I've also mentioned this in [1], including the fact that it technicall=
y
even complies with the guarantees given by PROBE_FORCE_SYNCHRONOUS. I.e. th=
e
documentation says:

	Use this to annotate drivers that need their probe routines to run
	synchronously with driver and device registration (with the exception of
	-EPROBE_DEFER handling - re-probing always ends up being done
	asynchronously).

However, I'm still not sure how I feel about this, since I consider this to=
 be
more like a workaround that just moves things to a "more approprite" async
context.

On the other hand, eventually we want everything to work with
PROBE_PREFER_ASYNCHRONOUS, so maybe it's also good enough for the time bein=
g.

[1] https://lore.kernel.org/driver-core/DGZJBMG2Y738.2MU5LXVGEDD47@kernel.o=
rg/

