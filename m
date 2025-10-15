Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF3ECCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkRSLUnpznpy3qYmmJfpc7POjKcvG8Z1LeLnSK1GGKQ=; b=jBVgrFoW2c/r5A0YaBgAfV44xq
	EN5ovLkyWffrsSwWw6GEcP5/bFiLHQ0WRlXyFhATayE5OZNGA3MLmfviG6kWRM8Ka+FElDwtpZakx
	RFaWq9Ps+67Gb3cMU1t32WBexOmF+iyFZR018amphMMqdaZYLG49PQ+mfIrZGy2O+b2p5bnyRrQ1t
	ggHL0jIBhb2fNDg+Lo3MGFuM80vV141OaaXVZh5HVv9qiiJKP0D/ImqCRbt7YUCAEis8sIpLIFxX8
	6v1DiwevgquVrA9X4BNoN50aMy+KCZOkUqoiRPVPYGRqJ9fIBFFVozBZdmONwKsnXcZHEoOo1dl/q
	bm5tjOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92mn-00000001xHQ-0J7e;
	Wed, 15 Oct 2025 14:47:29 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92ml-00000001xH6-116i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:47:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b07d4d24d09so590607166b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760539645; x=1761144445; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BkRSLUnpznpy3qYmmJfpc7POjKcvG8Z1LeLnSK1GGKQ=;
        b=j7zKsTzqi6QTnCyupzkXMbun3GuFCvEfM5u5sFmOHECCDc9FlXurDamewnwPkZeJwa
         TPKVm5aAnEJHm62GnQteJ9GDq6Q6wXauzAcg4rLQ4JpWB66NQr3rbaRAGMw5wJNYksLz
         0txQwo44cY7MPMvRF42XYG4fYRe6QlYbV1+WMclrGRit7Q1U6Fx+QJQKHa/kvKekvD3i
         9ZprB3N9RBfUlQHjqifTqqGOjrzYXV84cY3l64yFYaz1FwToq3eYgSPXrkv3jB03BhnJ
         7iuW77SmkcUr07n59cSGpkGwrQM+ZyaLMfl+rR8WU68ZF31f+WHVUzmE0kQ5ioBKcAlY
         2KNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539645; x=1761144445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkRSLUnpznpy3qYmmJfpc7POjKcvG8Z1LeLnSK1GGKQ=;
        b=b4whi7x9y3TVgX15rdSR79vDikXlgMhIYXEg51hWr4w7gT3uEZUWRnHVaJYeRh+0jK
         PHknPgqPZWw/yLiq9GoPmkUBOsIqO/K3EE3sa+ghvoR+NbL0br807HD3nX4jnbtOIlNJ
         AJgUTJkN8fGkzsupu+SW7UDbRq3F3J60WLgvUXvQoHrSXawV495ZOqo3LM06RaHg8u1p
         0Hwu7SZfopkdmbduYO0fBzG6inKovlcKQecaM6vLeoCg78H/YKFaXBF5+/eB/xdfSNBk
         PmTWfIXff6z3EopquW6QTgMQStPPhGgs+uvnPg7hKXNaZLGHTqrxWbJ2WF06dBKrELeK
         iz8g==
X-Forwarded-Encrypted: i=1; AJvYcCWyV9+aT66X0t3zg3iZFhr9oSuK0JH6pPxOKnNVcUQr1uOnQFDeZnnnMEgW7r/swIorfL2I/0xdDrotwX79SGPw@lists.infradead.org
X-Gm-Message-State: AOJu0YykuqUc5XygoEFhaoRUAL9FZ4cEnY5NPQu5gsVu4sBfimRYqFw0
	bt65356c0fZWxJ1Px64JZQTfJmEzMtEJBBPkGp86QDRyrerfRSCff0lh2X3EGFf5fjezaCXD9kE
	47/nTCaz1hEksCEVnB2U3HmG6U+as3qIaxXXEejF1OA==
X-Gm-Gg: ASbGnctZq0IgWouVRXplVU/qKn40N5v7FZHRJ834I8RX+S15QANEQBl6GLmUO9/jZ+A
	ryB6OxvHk+ikB8rfqulvfMGCzt4YhtiYStE0oQqg0XLu/wlnG4oV9RPOwQ/uP/GxreEUNE/QUEH
	sQJrLoNlk76zmIBAMay/stkKW23KPlxjlKQPU/FNuwYXYmDBNdY5Dk+cjFCNo1dPe/lZwzbwaLw
	nmGB3LqVyL/jGSST2/E2U/4G3nM0fRehaN1SR8Py7r2sr6pOxaXA43x9UugBGkiGsrLqD/L
X-Google-Smtp-Source: AGHT+IEUqGfQp9YhYQvza9pi3u1frVExIPZGobHvkJpepK8/VlN4XugYvlYQpaqAjcg5hzZJQWZYiCQ8a7FDZgL9rGQ=
X-Received: by 2002:a17:907:3e95:b0:b3c:cda5:dc5f with SMTP id
 a640c23a62f3a-b50aa48b9cdmr2796236166b.9.1760539645069; Wed, 15 Oct 2025
 07:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 15 Oct 2025 16:47:08 +0200
X-Gm-Features: AS18NWDY7WIS_O4_p56TfpOvWCBi95zCtvBsZn2zTDEoiMSusyplTlJpgBuyRf4
Message-ID: <CACMJSetWthCcJo8v7EuUK-aDKhf5KTNG5WQQ9aTQu62B+E=DMA@mail.gmail.com>
Subject: Re: [PATCH v16 05/14] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_074727_320090_5839C348 
X-CRM114-Status: GOOD (  22.16  )
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

On Wed, 15 Oct 2025 at 06:39, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> Currently, there is no standardized mechanism for userspace to
> discover which reboot-modes are supported on a given platform.
> This limitation forces tools and scripts to rely on hardcoded
> assumptions about the supported reboot-modes.
>
> Create a class 'reboot-mode' and a device under it to expose a
> sysfs interface to show the available reboot mode arguments to
> userspace. Use the driver_name field of the struct
> reboot_mode_driver to create the device. For device-based
> drivers, configure the device driver name as driver_name.
>
> This results in the creation of:
>   /sys/class/reboot-mode/<driver>/reboot_modes
>
> This read-only sysfs file will exposes the list of supported
> reboot modes arguments provided by the driver, enabling userspace
> to query the list of arguments.
>
> Align the clean up path to maintain backward compatibility for
> existing reboot-mode based drivers.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

[snip]

> +
> +static int create_reboot_mode_device(struct reboot_mode_driver *reboot)
> +{
> +       struct reboot_mode_driver **dr;
> +       int ret = 0;
> +
> +       if (!rb_class) {
> +               rb_class = class_create("reboot-mode");
> +               if (IS_ERR(rb_class))
> +                       return PTR_ERR(rb_class);
> +       }
> +
> +       reboot->reboot_dev = device_create(rb_class, NULL, 0, NULL, reboot->driver_name);
> +       if (IS_ERR(reboot->reboot_dev))
> +               return PTR_ERR(reboot->reboot_dev);
> +
> +       ret = device_create_file(reboot->reboot_dev, &dev_attr_reboot_modes);
> +       if (ret)
> +               goto create_file_err;
> +
> +       dr = devres_alloc(release_reboot_mode_device, sizeof(*dr), GFP_KERNEL);
> +       if (!dr) {
> +               ret = -ENOMEM;
> +               goto devres_alloc_error;
> +       }
> +
> +       *dr = reboot;
> +       devres_add(reboot->reboot_dev, dr);

If you're using devres here - at least make it obvious by adding the
devm_ prefix to the function name and make it take an explicit struct
device * parameter so that it's clear who owns the managed resource.

Bart

