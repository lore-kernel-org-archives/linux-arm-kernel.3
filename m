Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AF4C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DihJy5N0sB1kkH1tX0aCbw65bN6rRxYJvuZ8x/mq9w4=; b=crhqZ6bs7c+1oV0HAWzPeEnM5o
	OmxHm6dc3ifyInQO/wVwRGprtxzpjumTXl1ksgNNhwiRGo79AqklMuW0wPbV4dHp5F7VBiDpBf2yz
	ReeohvxXU/LH7wmA2507y6Z7VKYXUNq15M4uS4eAYo/Ha7rddpDm2UR9Ic4d85PTJ8oM+PLpQy6N5
	f16tfaUoUfToNmn5XSu1kOAY9UaukolNQw2x4CnkSIGAL0zIwMEE7kbgQXoAqKRwOqJPgtEXA+/PF
	Jdl7on0oBroLQfGT++m1nuw23VYv9quKpmg7SNaipsOYnsYvfPpTvVR65pOhH3Rr68zKP+DE28miK
	3ZoDePag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETOv-00000009alE-0fyk;
	Mon, 12 May 2025 13:41:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESrM-00000009U5p-09NY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 13:06:21 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a0ebf39427so3510095f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 06:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747055178; x=1747659978; darn=lists.infradead.org;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DihJy5N0sB1kkH1tX0aCbw65bN6rRxYJvuZ8x/mq9w4=;
        b=bDxtiJKgzp1loCyQQgkxnN5B4OhlLrIwYRQAwGlVKIJBw2KKhfQp6UxsOphVMA1dT1
         XfEYcatyWDoQ8/qdZF2qiQ4i2sgmgeYouApy4jMG7xMqIc8g8P1JSRJ4Arnb5gsZMmkz
         EKuRxYwRaU41gG2oxuWavmQIzw2OGH+h/MOnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747055178; x=1747659978;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DihJy5N0sB1kkH1tX0aCbw65bN6rRxYJvuZ8x/mq9w4=;
        b=VzULxL+KowCyrH5r7JoT4DUlEH1OC0T03ZIuqlhY+A88gFrDmRrk8Y9ikBqTPO5rTM
         BtjByycGpV6TG/2D6SPtq95JjTwdHPpqI8di5+aKrdIMCkGD8ahHu3PDM8/r8P9Gu+G0
         3Qyvn6PV2VyXQxQKxcKtI+xOU0lKPGUHC2Ci9cocgewRZiWXi48ZRYyG8HzSKOMBladd
         RRyGJx4B43HbGNP6oqGSqc1N0Ua8VRc8k5dSEUPzaMNMR3FJA0DnM3vUCNqDB6omDOh0
         NQIcoH1O6f2muYEe7OhXUYWKY8tzbSXc6Gqph9NaFFFed4dLRZSiU1KCuwW7qZNNlRFL
         Jt/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRRjA+akO7GVU8pCEJFQBmj19yKvln4t8KBjrz3U4ihtkrRo74MR2bs+U+cBgGtD8hZwHNMxx95sn3Fw4+MAnA@lists.infradead.org
X-Gm-Message-State: AOJu0YxgclSo5oJsbFMyPdkhIHCP85VIOOYKXf+7vXodjaqqA2d7iyNn
	+9ikap3hHY7uJDl/XXXxvY2qDPhlTLW5MY/gYAl99bB4fOwcRNBMg0/YnLpGCA==
X-Gm-Gg: ASbGnctSgi0J8PpcMBUzj57sXV5vwOTFX/1wkuCEPEQHP9yf/THSzSLOfyUoPDx4A/t
	6XkAoIswx5py8vHA+I9pHIyzBO8004UBmvhU83KMzUYWkqBe2BmIz9g2Mx/1OLX+EyjfaA5GxWm
	e9JNodUdnEvniWxFLwgzvo7Q9pOQzw1OZ0+uYtzztgnytf9xxZmjaT0i1Ul3bl479KkAnlqtU8g
	YDvOBmKmGQC4nc1a/7uEkrQBGEbx6utkB+XCDee00KcJasCfQcGUtMyKaA1luxEGEwlZ1jgHmEY
	F6IpyQJC0ulPsOE4RlKt+vsefBp8KOgI3t3Y2OlZ8RkZsTN+uJcd/lJ9kZfewITM4PQ7IOH3APP
	M2v+68K8Au51THo7EgRJ9PwgALKOhQlI=
X-Google-Smtp-Source: AGHT+IFHHW+tO0oBp3s24DoLvcCzI4LBz7QAtY4LH5Z3+bpnPSagfLujXuQW5+ah6tGWIrHi6wlRcw==
X-Received: by 2002:a5d:584a:0:b0:3a1:fd60:883 with SMTP id ffacd0b85a97d-3a1fd600accmr6854719f8f.23.1747055177878;
        Mon, 12 May 2025 06:06:17 -0700 (PDT)
Received: from [127.0.0.1] (90-47-60-187.ftth.fr.orangecustomers.net. [90.47.60.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ce36sm12497030f8f.71.2025.05.12.06.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:06:17 -0700 (PDT)
Date: Mon, 12 May 2025 15:06:15 +0200
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: Andrea della Porta <andrea.porta@suse.com>
CC: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, kernel-list@raspberrypi.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v9_-next_08/12=5D_arm64=3A_dts=3A_bcm271?=
 =?US-ASCII?Q?2=3A_Add_external_clock_for_RP1_chipset_on_Rpi5?=
In-Reply-To: <aB0d8kNVtAEoW8Ts@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com> <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com> <aBp1wye0L7swfe1H@apocalypse> <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com> <aBtqhCc-huQ8GzyK@apocalypse> <779ae10a-3174-4dbb-9130-008393b59745@broadcom.com> <aB0d8kNVtAEoW8Ts@apocalypse>
Message-ID: <CDB01DD9-27C7-4A4D-8340-F091865876A8@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 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
 3LBXw4WCw3QhOXY+VnhOn2EcREN7qdAKw0j9Sw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_060620_185606_2E3B4B6D 
X-CRM114-Status: GOOD (  29.49  )
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

On May 8, 2025 11:11:14 PM GMT+02:00, Andrea della Porta <andrea=2Eporta@su=
se=2Ecom> wrote:
>Hi Florian,
>
>On 19:10 Wed 07 May     , Florian Fainelli wrote:
>>=20
>>=20
>> On 5/7/2025 4:13 PM, 'Andrea della Porta' via BCM-KERNEL-FEEDBACK-LIST,=
PDL
>> wrote:
>> > Hi Florian
>> >=20
>> > On 09:32 Wed 07 May     , Florian Fainelli wrote:
>> > >=20
>> > >=20
>> > > On 5/6/2025 10:49 PM, Andrea della Porta wrote:
>> > > > Hi Florian,
>> > > >=20
>> > > > On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
>> > > > > The RP1 found on Raspberry Pi 5 board needs an external crystal=
 at 50MHz=2E
>> > > > > Add clk_rp1_xosc node to provide that=2E
>> > > > >=20
>> > > > > Signed-off-by: Andrea della Porta <andrea=2Eporta@suse=2Ecom>
>> > > > > Reviewed-by: Florian Fainelli <florian=2Efainelli@broadcom=2Eco=
m>
>> > > >=20
>> > > > A gentle reminder for patches 8 through 12 of this series, which =
I guess
>> > > > would ideally be taken by you=2E Since the merge window is approa=
ching, do
>> > > > you think it's feasible to iterate a second pull request to Arnd =
with my
>> > > > patches too?
>> > > >=20
>> > > > With respect to your devicetree/next branch, my patches have the =
following
>> > > > conflicts:
>> > > >=20
>> > > > PATCH 9:
>> > > > - arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b=2Edts: &pcie1 and =
&pcie2
>> > > >     reference at the end, my patch was rebased on linux-next whic=
h has them
>> > > >     while your devicetree branch has not=2E This is trivial to fi=
x too=2E
>> > > >=20
>> > > > PATCH 9 and 10:
>> > > > - arch/arm64/boot/dts/broadcom/Makefile on your branch has a line=
 recently
>> > > >     added by Stefan's latest patch for RPi2=2E The fix is trivial=
=2E
>> > > >=20
>> > > > PATCH 11 and 12:
>> > > > - arch/arm64/configs/defconfig: just a couple of fuzz lines=2E
>> > > >=20
>> > > > Please let me know if I should resend those patches adjusted for =
your tree=2E
>> > >=20
>> > > Yes please resend them today or tomorrow so I can send them the fol=
lowing
>> > > day=2E Thanks
>> >=20
>> > Sorry, what's the best wasy to provide the updated patch 8 to 12 to y=
ou?
>> >=20
>> > 1) Resend the entire patchset (V10) with relevant patches updated
>> > 2) Send only updated patches 8 through 12 (maybe as an entirely new p=
atchset with
>> >     only those specific patches)
>>=20
>> Either of those two options would work=2E Maybe let's do option 2) in t=
he
>> interest of keeping the traffic low for people=2E
>
>Could you please take a look at this:
>
>https://lore=2Ekernel=2Eorg/all/aBxtyvI3LUaM3P00@apocalypse/#t
>
>besides patches 8 through 12, would you like to take also binding patches=
 + clock
>driver (patches 1 to 4, if Linux Walleij is not willing to take patch 2 h=
imself),
>and maybe also misc driver and its dts (patches 6 and 7 unless Greg has d=
ifferent
>ideas)? I know this is almost the entire patchset, but it's getting hard =
to escape
>the dependency maze=2E
>I'm open to any alternative solutions, more details in the link above=2E

If I am taking the whole patchset I would need maintainers to provide the =
adequate tags=2E I would prefer to only take the DT changes, with an unders=
tanding that drivers wouldn't be active unless the relevant DT entries are =
present as well=2E

I am out of the office until the end of this week, so there may be some de=
lay (more than usual) with my responses=2E

Florian

