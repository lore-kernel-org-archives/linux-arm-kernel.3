Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B30C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 07:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOX9X8brnwUNsz5uO4Te0xlPw30giJyAMqsCiquXPp4=; b=C3ME1QcoLnqLxENlQ9ZTmVU8Mw
	jQ4n3K4fUiRdGvGJ5SCyO7/2c8jy8iV+ojNxDuvXAma0J4TJDlibYUX9nSjv5RBaBucEtrAx8MMdL
	8AcuZipqPDzG1zBuvEYDH+tY0W3BXCldXufvH98scA5uFFmz76nBsOga3IPykHbR3u7iICs03iSp/
	gLe0S9sNzeCugm+m4aijjRlwjTpLOuLHNLgki0EY0eFamppgyjnaArmHccHc63U5mOtxPVb0f0jUj
	+oOhXV3QFqEJiqIwINz192JPc8nA8ZNFQOl7b8qMvKhhEP8GrPtcm1izgv3G0DvzpvvnT2AH2qjuP
	Q5nUmA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhNsR-000000034SW-12dh;
	Thu, 31 Jul 2025 07:38:59 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhNnK-0000000346V-2q7O;
	Thu, 31 Jul 2025 07:33:43 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4ab6e66ea68so7866391cf.1;
        Thu, 31 Jul 2025 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753947221; x=1754552021; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOX9X8brnwUNsz5uO4Te0xlPw30giJyAMqsCiquXPp4=;
        b=LTpkl/GdEVfl8rZM1W1hDsS0/vElfoA7wIhN245dlH0YxUUwbaDnZUVoDv3IsQOBc5
         /CHJjQRMsIuY5Y7/nK1scAoRJlhb0tGv9GFYT6nvd25HODlOGKDVF1rAwA59hdWAtpVp
         isak5P12g7EyaovUEBRBxBFAPCWjv02dh3+pxSv8YZQlen40qpQAggSPZ6sCCuKmUDJl
         5LIXq+eNvoLVRXnQO1AzCdVkW/zwIp14RtxZI8QoetEAT1DMf0/GHMI0emTqEChq3TGS
         RzxcFpdvSiLN8/eeJn5d2NEjmjquEBiHP0/IqE2FGmCyz499ui4zyxE1Qnv1ur/DGog6
         Hkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753947221; x=1754552021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOX9X8brnwUNsz5uO4Te0xlPw30giJyAMqsCiquXPp4=;
        b=i48dK9NlSRutf3YbLg0FO4BaZiLIbTJUcBZks7L219vyVwqvGzWbhEmYIeOp4czsp1
         BSAV5mIGtfbCIfD8Li982sv2buKzvkoT6X9FgyZUJuKbFtvV9kSsghXHTfZpnwIhE54D
         mWe+bt+HIjR2WPouGf+76uHFx1KKCAq6icjyv37t7MOP2PSLoJgAL4fA7LXts6U2+PRW
         et9eUI/vQLz9iGPug+3QVhiMmxLAfjrkYHACBP6/wOwDAnnByq9GZvOQsYQFjZsANBrB
         s8bkcr3DCOSwm3sJQ2JZIAQmxnDhC4LfwpIuWEqgcefl5NjnkhlbqXWsw2x/L1SbLI0n
         0JXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeSDohD4agayCVVGlsdB+IMFeq5ZVCESIhKgjAF4GiYhihkYdM+i1M5pgxlfsSjLKqADkm8LOOU6o+coqLf8X/@lists.infradead.org, AJvYcCWcxZN+O3NVeUeqrqIzRFnmsyPQHAa/R760uoshGRr5ftYvMvXeaZvU53zfwbZWoEI2OVzf1xzqWGUhMS6EpeA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzai7A7pujSG/N82wkKhRWTsUviA5Lm3YuFFse0Hz1HHcM9fg7U
	0dW6EmDuuGyB8fQix6k9J1FJQyyKHMCa8xUZaA1rfWW7Gri3o/07vPYSQBSsj7CHFEMs3g0l1UG
	5tcp1WRHyrrHm1bekzmMHZEgu6dodmlM=
X-Gm-Gg: ASbGncsIU2PkOl5ZJ1dFNZHVMIOa84g3Z+jyWC8rVAIZG2yN8QCVocDkzmeh3RgVGnu
	SJxfzBWT4l/78NmU+CGm6piT/y6oxnvD6gJUMHSw0tdDhpyKBwq3xI8WdoyuhMlC2ac5QlRE4sf
	WFj5jSBpp/pUeZjOabwVyzA9FNAYJ1dlMeTQnMg93U9Q6GrjaMhe8xDVbU3AaYt/pFTaQ0714RQ
	zlbJVOnueJ/Pqd/clh84kCBZAZFwjiPZR8BGa65
X-Google-Smtp-Source: AGHT+IH1uwkUGAwbjx/9dKqcwJTQI9b2LQO1Th3mXrOlkX6OvkMWjy54q1bCvJ9oudoi0B/QbEA71tvh/WvbZgihO6E=
X-Received: by 2002:ac8:5913:0:b0:4ae:cc75:4704 with SMTP id
 d75a77b69052e-4aedbc6b2abmr108326681cf.59.1753947221032; Thu, 31 Jul 2025
 00:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
 <aHgHxR1_Gzu8Dwbm@mai.linaro.org> <4178173.5fSG56mABF@diego> <14c91ee4-3a09-4ec9-966f-0d563d7c8966@linaro.org>
In-Reply-To: <14c91ee4-3a09-4ec9-966f-0d563d7c8966@linaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 31 Jul 2025 11:33:32 +0400
X-Gm-Features: Ac12FXyBhKCe01359PD8yUXtXOTB-iOa83dWxetYoDpIa3sijPk9zpEZPKHbrQs
Message-ID: <CABjd4YzJeNf0Qq9qFeMcoYQV5erZGUeOpmJynRW88AeL9dJNhQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] RK3576 thermal sensor support, including OTP trim adjustments
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ye Zhang <ye.zhang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_003342_719702_0BC3E1AB 
X-CRM114-Status: GOOD (  30.91  )
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

Hi Heiko!

On Thu, Jul 17, 2025 at 12:20=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 7/17/25 09:21, Heiko St=C3=BCbner wrote:
> > Hi Daniel,
> >
> > Am Mittwoch, 16. Juli 2025, 22:12:53 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Daniel Lezcano:
> >> On Tue, Jun 10, 2025 at 02:32:36PM +0200, Nicolas Frattaroli wrote:
> >>> This series adds support for the RK3576's thermal sensor.
> >>>
> >>> The sensor has six channels, providing measurements for the package
> >>> temperature, the temperature of the big cores, the temperature of the
> >>> little cores, and the GPU, NPU and DDR controller.
> >>>
> >>> In addition to adding support for the sensor itself, the series also
> >>> adds support for reading thermal trim values out of the device tree.
> >>> Most of this functionality is not specific to this SoC, but needed to=
 be
> >>> implemented to make the sensors a little more accurate in order to
> >>> investigate whether the TRM swapped GPU and DDR or downstream swapped
> >>> GPU and DDR in terms of channel IDs, as downstream disagrees with wha=
t's
> >>> in the TRM, and the difference is so small and hard to pin down with
> >>> testing that the constant offset between the two sensors was a little
> >>> annoying for me to deal with.
> >>>
> >>> I ended up going with the channel assignment the TRM lists, as I see =
the
> >>> DDR sensor get a larger deviation from baseline temperatures during m=
emory
> >>> stress tests (stress-ng --memrate 8 --memrate-flush) than what the TR=
M
> >>> claims is the GPU sensor but downstream claims is the DDR sensor. Inp=
ut
> >>> from Rockchip engineers on whether the TRM is right or wrong welcome.
> >>>
> >>> The trim functionality is only used by RK3576 at the moment. Code to
> >>> handle other SoCs can rely on the shared otp reading and perhaps even
> >>> the IP revision specific function, but may need its own IP revision
> >>> specific functions added as well. Absent trim functionality in other
> >>> SoCs should not interfere with the modified common code paths.
> >>>
> >>> Patch 1 is a cleanup patch for the rockchip thermal driver, where a
> >>> function was confusingly named.
> >>>
> >>> Patch 2 adds the RK3576 compatible to the bindings.
> >>>
> >>> Patch 3 adds support for this SoC's thermal chip to the driver. It is=
 a
> >>> port of the downstream commit adding support for this.
> >>>
> >>> Patch 4 adds some documentation for imminent additional functionality=
 to
> >>> the binding, namely the trim value stuff.
> >>>
> >>> Patch 5 adds support for reading these OTP values in the
> >>> rockchip_thermal driver, and makes use of them. The code is mostly ne=
w
> >>> upstream code written by me, using downstream code as reference.
> >>
> >> Replaced previously applied version V5 with this V6 patches 1-5
> >
> > are these commits available somewhere?
> >
> > Because git.kernel.org reports that
> >    https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git
> > has not seen activity in a while?
> >
>
> I just pushed the bleeding-edge branch

Just wondering if patches 6-7 from this series are on your radar?
Driver changes are in -next AFAICT, but not DTS. Can't wait to get the
temperature monitoring working on RK3576 without out-of-tree patches
;-)

Thanks a lot,
Alexey

