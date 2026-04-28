Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6265DFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWl1v7S5OHWWsV3GS/TSBi3Cja7I0YV1Fvhqc+5/GSE=; b=NgShQieI8uNzX1t8P0wQFqSYpA
	47+zbQ9xB2dmsfuxu8fD6AjWVHJ6CuENeNi8sti+zBNoDgYfEIIlYtXwQDJIS6q8s1x9x8Mfu5ebN
	aDgD+ZEGCaSoV797nE9geqQtBJnCg8O+cbdw2P3hNm37k7SlOwgnpiSORziVWqr8SH4FUCg3mQFFn
	5dRpGo9xsrMzxIcWQh4BnFFbr6V8Y+9qmwxCPRmV8GlLtkkMrtn+femGN9sZDGuRhdMc2R/2j0DFu
	zG0JpZwKlAeEJJXkNhVSIxb+YPTCXSkjUqAwyKGxi4w+QRKyYKwyoK8Jrl4CMkmPYpL16sKA9mtwI
	hT9BbjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdQk-00000000qV6-1zEI;
	Tue, 28 Apr 2026 08:04:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdQg-00000000qSA-3w0i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:04:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 351EA44855
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB92DC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363466;
	bh=RU2RfIsE5wPl5KsOhJRREp+MuYdS5uZPUVCQPRYO/oI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=cqUNCC6pEx0EA84DmTUS5wWcDDKCDyotUHQamocWl1fgzFcrW/b8M8OcAq3Y7Pe/v
	 jnwG6z2u9s5Y2230o1DfLmjFUSl3Wb5zQM7RS/OrxQQyxMIQR2cJaLPhQjZrPEAroo
	 DSUlWo01izIkOXW1xjrSsCrnBVjplv6bj0fflUtxCrWSPxSJTMAuNT0GXKwzxs9hu/
	 EVx974wAD33xBxKWWv8UfL0r5t1ycALZQnJEfV3Gu/kmMFcM1U1mFhOuPM8yDKD2Yx
	 jOfM/PKtmbBPQ4SbDRHZ2LYz98mvs76X8NwHusrfWEm6sSLcrZuMn1ET/3XIwZsGes
	 Dh+WvQp8yd+UQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38ce8a5bc20so118280911fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:04:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+hj/ZhUnu2vLxe8Cht8VHlmeYomtEAWUAx97VwAlj3M8kmEvapooER6gu8d1T0HGQjtUc0vvz7x+1GzQkGmF0o@lists.infradead.org
X-Gm-Message-State: AOJu0YyHG59rIABJLN9OnhG08mfVRvEjs+LU0X34d/YB8sMNVuh4NbmJ
	05YFXLfGMufvGIOP1g/Fi92wlqzckhxKpoVFPxxsmMlKSWjuxkiCdZ2/iIdo79rRmI4cLCB7TAc
	f4q7LwJuQVCoHbpZsDetlzkWlJvv3WmEAaRXhQdaRmg==
X-Received: by 2002:a05:6512:3b87:b0:5a4:1918:20e with SMTP id
 2adb3069b0e04-5a746611061mr910141e87.30.1777363464618; Tue, 28 Apr 2026
 01:04:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:04:23 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:04:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-13-dcf937775e73@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-13-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 01:04:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfaTsZFrf4YoceODg3_R0-1jreNBabfsmOcuvJDnho4iQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ju3RPxv-6duyvbXGIr26bogK-Xp8kGODdJYnjXZthAG5bndYhRYJFxrZQ
Message-ID: <CAMRc=MfaTsZFrf4YoceODg3_R0-1jreNBabfsmOcuvJDnho4iQ@mail.gmail.com>
Subject: Re: [PATCH v21 13/13] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Song Xue <quic_songxue@quicinc.com>, 
	Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_010427_011605_1A171F1B 
X-CRM114-Status: GOOD (  10.68  )
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

On Mon, 27 Apr 2026 19:34:53 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
> psci-reboot-mode driver.
>
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via the
>   Firehose protocol.
>
> Support for these modes is firmware dependent.
>
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

