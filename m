Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDEFCCF2CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 21:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eeqct3hmZ10hoajGliBHIs1h/qa8t1nkkLTkXEoWJ6E=; b=xwatkbVZMFNO+N7ad5DiW+0FN1
	ir/S8ImVQ7oxsmpqAyb6yQ6RbVfg4efyphnRWDJHsdUv2+OgEqQl2T1XYO9gro7V2cl0EX/3C5gLg
	gqDPB4x7S56LN0ko3NBmV1jg2Z17Spzt4Z2NgfnqHT7JBOIj5noX7gCFxIXJLmewDN1i0LmRTzV2v
	cfex7oXcCz/vGnCtwxZ9YhgxRHqYGS01BezD5WcR6nOEFQ1o4WIErzXZZsT4/RPiu/yOYT5fLXdr4
	fdwCGEeC3JeAm/LBU6GbEozMpm51cJXoChDnZi40kjrb2cvJIPCZ3IA67CyJfSdLLAH9xrQujFpFs
	y5BfZhXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIBzU-00000005GNV-2jHz;
	Sat, 17 Oct 2026 21:30:56 +0000
Received: from out-159.mta0.migadu.com ([2001:41d0:1004:224b::9f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIBzR-00000005GLi-1QsV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 21:30:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=oFKzuUCJrKx39ZMIlQ2/kgBJRP6R7Lq8f0WtyI+Xr90=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792272646; v=1; x=1792877446;
 b=XjjbILmEv+znvTWFogSTQRgR80z2Xr6J0Mspw8g+8NgPV+vqwXJHrJ8y6LU1+0iO3lAOUplv
 3sio0cDIMMJ3lK9dV2WE26vlcmvxOhtwbCWYjl7kuFe8unHyNR4LSCKgADs2FfBpW8wrqr3zepO
 Ic+C6Wrjhcwj6i4+AmwBx3Cw4TLVPc14jscvVt3JBllwb6sbkYMBozi2ZQ4pmKcXuIhqoBw0tb/
 GUXTZnaiGU8/h19e5Wo83TDK+rgWzwHkoY78S/3jlfl52bysFKxWSRjfekwwQNtE2Byig3hilNv
 8w4WYbz7jzm2TLqz1DRScJ5vQeAjEDIoGlzNJO08QSRZw==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4b86bf520d346430;
	Sat, 17 Oct 2026 21:30:18 +0000
X-Mizu-Trace-ID: 4b86bf520d346430
X-Migadu-Flow: FLOW_OUT
Message-ID: <748ec3d0-2eb6-454b-b0ce-36c04d7bf844@packett.cool>
Date: Sat, 17 Oct 2026 18:30:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Reza Kurniawan <imkyufie@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
References: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
 <20261017-psci-fix-v1-1-dedae27e4a31@gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261017-psci-fix-v1-1-dedae27e4a31@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_143053_805953_6D17A6C5 
X-CRM114-Status: GOOD (  19.04  )
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


On 10/17/26 1:41 PM, Reza Kurniawan wrote:
> From: Alejandro Tafalla <atafalla@dnyon.com>
>
> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> call is rejected with NOT_SUPPORTED.
>
> PSCI provides no call to read back the current suspend mode, so the OS
> cannot tell which mode the firmware is operating in or why the switch
> is rejected.
>
> Add an optional flag that tells the OS not to issue
> PSCI_SET_SUSPEND_MODE on such firmware.
>
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> [Reza Kurniawan: split out the patch, rewrote the property description,
>   renamed the property]
> Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---
>   Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
> index 0d04389c81..7777077dd0 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -98,6 +98,19 @@ properties:
>         [1] Kernel documentation - ARM idle states bindings
>           Documentation/devicetree/bindings/cpu/idle-states.yaml
>   
> +  skip-suspend-mode-switch:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Do not issue PSCI_SET_SUSPEND_MODE.
> +
> +      Some firmware advertises support for OS-initiated mode but rejects
> +      every suspend mode switch with NOT_SUPPORTED. Since PSCI cannot report
> +      the current mode, the OS cannot verify the state the firmware is in.
> +
> +      This property is an assertion that the firmware works correctly without
> +      a mode switch. This is a workaround for non-compliant firmware, only set
> +      it on firmware known to behave this way.

"for devices that ship with firmware known to …" would be better 
phrasing imo, "set it on firmware" might sound like it's implying things 
that aren't actually happening


Thanks,
~val


