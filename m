Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3702CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3t6w/B73++fL6dgspzMfSkeJ6QCbqZ/GGaWnkDXFJ8=; b=R5Kneohv/4BSjCKzd7w1slHM+2
	SCpZz+OG9xcOUJhv+PNsHdIKts7ZyWoaiPHFhIMgmAc0OTDhJp6vt/X7XyLu6eJJtg4vLcmtwHJQp
	i8hyDcxmKEFP5aP005Oo/7eOPnHP7jVf18zxVzq7enGlFL7hd9KQ1uqwnMlWaHyLzrJYn0dDKB1rT
	WtIKgSDNXJ+9xzTJsQzVehSzOTV87HhJsvKatZIKGgAb4gqxM02fsAmaIVJv+PBZGIZEMninIEHmj
	ALEh7v+7HpVZDJ8YuV/c15lrE6mIHQKhW1w5KXM7STVD+ajH/4bgqP3os/AQBnHISqfMh3gqCbfCt
	S0ZHNVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphqq-000000045nm-0Bt2;
	Sat, 23 Aug 2025 06:35:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSEm-00000002gkY-3jSV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:55:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0922460268;
	Fri, 22 Aug 2025 13:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3125CC113CF;
	Fri, 22 Aug 2025 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755870923;
	bh=zSm1zQkFdhpmY/HgWj2Qj7y/a2Z/6Ftha+/cqaK8MEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLkkNl3dXIsDnJZtsoiU1Vm9inBEz27/WByO/q5z3/GGf24wqq7LFXOKlQqSAmwYH
	 XEsmcwA495cLpTYMi23yUD7uVqMpOUQ/kZM+5scQWVBWtf+Lfhg3JUpDBbAUjaqA0z
	 Kr9az9pakd2wZhulu7Z5YD6wRAaqk9jjK74McEH8yyrQi8CGpWwhmFejwAC3/t7jxf
	 G3VHJqB3aLMYeMBfkXWdDt8dhy2d4GczXYyAmLuBQhAyJLMH+pbZ0DyyGIOa2xs57m
	 1JLxMstwbqwUAttH0HW+mnZVdVUNYVlLtvAJvhw7tQv74IvFdTtjsF7TLFdNzauyb0
	 9od25tu/b7Tgg==
Date: Fri, 22 Aug 2025 08:55:21 -0500
From: Rob Herring <robh@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	willmcvicker@google.com, kernel-team@android.com
Subject: Re: [PATCH 1/3] dt-bindings: firmware: google,gs101-acpm-ipc: add
 clocks node
Message-ID: <20250822135521.GA3487754-robh@kernel.org>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-1-6bbd97474671@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-acpm-clk-v1-1-6bbd97474671@linaro.org>
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

On Tue, Aug 19, 2025 at 11:45:36AM +0000, Tudor Ambarus wrote:
> The firmware exposes clocks that can be controlled via the ACPM
> interface. Describe the clocks exposed by the APM firmware.

ACPM? APM is Advanced Power Management aka the predecessor to ACPI?


> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 28 ++++++++++++++++++++++
>  include/dt-bindings/clock/google,gs101.h           | 15 ++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
> index 9785aac3b5f34955bbfe2718eec48581d050954f..27cdf9c881ca680e78e77a0e14ffcffeba970871 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
> @@ -27,6 +27,29 @@ properties:
>    mboxes:
>      maxItems: 1
>  
> +  clocks:
> +    description:
> +      Clocks that are variable and index based. These clocks don't provide
> +      an entire range of values between the limits but only discrete points
> +      within the range. The firmware also manages the voltage scaling
> +      appropriately with the clock scaling.
> +    type: object
> +    additionalProperties: false

You don't need a child node. Just add #clock-cells to the parent.

> +
> +    properties:
> +      compatible:
> +        const: google,gs101-acpm-dvfs-clocks
> +
> +      "#clock-cells":
> +        const: 1
> +        description:
> +          The argument is the ID of the clock contained by the firmware
> +          messages.
> +
> +    required:
> +      - compatible
> +      - "#clock-cells"
> +
>    pmic:
>      description: Child node describing the main PMIC.
>      type: object
> @@ -59,6 +82,11 @@ examples:
>          mboxes = <&ap2apm_mailbox>;
>          shmem = <&apm_sram>;
>  
> +        clocks {
> +            compatible = "google,gs101-acpm-dvfs-clocks";
> +            #clock-cells = <1>;
> +        };
> +
>          pmic {
>              compatible = "samsung,s2mpg10-pmic";
>              interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
> diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
> index 442f9e9037dc33198a1cee20af62fc70bbd96605..f1d0df412fdd49b300db4ba88bc0b1674cf0cdf8 100644
> --- a/include/dt-bindings/clock/google,gs101.h
> +++ b/include/dt-bindings/clock/google,gs101.h
> @@ -634,4 +634,19 @@
>  #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
>  #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
>  
> +#define CLK_ACPM_DVFS_MIF				0
> +#define CLK_ACPM_DVFS_INT				1
> +#define CLK_ACPM_DVFS_CPUCL0				2
> +#define CLK_ACPM_DVFS_CPUCL1				3
> +#define CLK_ACPM_DVFS_CPUCL2				4
> +#define CLK_ACPM_DVFS_G3D				5
> +#define CLK_ACPM_DVFS_G3DL2				6
> +#define CLK_ACPM_DVFS_TPU				7
> +#define CLK_ACPM_DVFS_INTCAM				8
> +#define CLK_ACPM_DVFS_TNR				9
> +#define CLK_ACPM_DVFS_CAM				10
> +#define CLK_ACPM_DVFS_MFC				11
> +#define CLK_ACPM_DVFS_DISP				12
> +#define CLK_ACPM_DVFS_BO				13
> +
>  #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
> 
> -- 
> 2.51.0.rc1.167.g924127e9c0-goog
> 

