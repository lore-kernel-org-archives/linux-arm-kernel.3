Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F28C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fluh5yS9+7yKj/7XUv8W4sSCve4jWOnqFlBa96EHvGg=; b=vkoHMva4FNtEvXGIB9IxwU5fHw
	H0Xpw0LVDj2jykIdaDq/Fy6lAZxnoCO3DydRi67IKXIshBdPAix31CPJk+rwjQwl8mx6+rP42a5uN
	fnJhks0NAiPWSic84Zmi0IX5LJ58M5LGJ9aJQFBmxyA2hU7toyMMQ7TDNXBBkMUTvyHxTIuoKvz6u
	cTcWGMysnISQhlllvVQBaIS86vGoEScsXeUa+HC2ewH2eMONpOLJbnjBWErxj99YFo1UTwDZeG444
	incG7q4pUn8Fu+tI1B8Ka1Mn9DHcMa0A0LjRQC7M7OshXsJ0L5BRRk7G7oo39K8MqwtCOYKgSRNt7
	WSASD+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bmh-0000000F5Ea-0PjZ;
	Fri, 18 Sep 2026 16:49:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bmg-0000000F5EU-2SE3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:49:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E848A6053D;
	Fri, 18 Sep 2026 16:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7AE71F000FF;
	Fri, 18 Sep 2026 16:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750197;
	bh=Fluh5yS9+7yKj/7XUv8W4sSCve4jWOnqFlBa96EHvGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ARH+iPpY4RgoXo+iSq1LrQRSK28pS3t9C5aOO8sC1BLM+RCgzsl7eqXGyCUjNHCPd
	 3ovidnXxpcJzZlHn6sV//wc7yKtB45u6Z7CK33te/v1lajNlwJAHBIrzDsib0NNnQi
	 X8pnRuIq/VmXIl12htCPxx6di2KO9wfFjZt0luJvVJnjcBR6Xd3o07ywQ/7b16Zw2/
	 H2xqaRsVljLmrYNHNoYcTmoOBYXAqLY00RHWezAB8tjm00/s47jJ/PiMOmfB4r+zUU
	 LvmlMjgAAIEpKckvWB2h+HknVQkAcUOk3utZfSuL1kbKQYwlfGQXD7IpuS9ukmKpF9
	 PEDGzHeGrKP5g==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	Pierre Gondois <pierre.gondois@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: fvp: Add missing properties
Date: Fri, 18 Sep 2026 17:49:47 +0100
Message-ID: <178975014449.1809739.1787827854019049791.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914155854.123341-1-pierre.gondois@arm.com>
References: <20260914155854.123341-1-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 14 Sep 2026 17:58:50 +0200, Pierre Gondois wrote:
> In order to align the Device-tree description with the ACPI description
> currently available in the edk2-platforms repository:
> - repo: https://github.com/tianocore/edk2-platforms/
> - at: Platform/ARM/VExpressPkg/ConfigurationManager/ConfigurationManagerDxe
> Add some missing properties to the Device-tree description
> of the FVP RevC.
> 
> [...]

Applied to sudeep.holla/linux (for-next/juno/updates), thanks!

[1/3] arm64: dts: fvp: Add cpu-map property
      https://git.kernel.org/sudeep.holla/c/54087b4bac55
[2/3] arm64: dts: fvp: Add EL2 Generic watchdog
      https://git.kernel.org/sudeep.holla/c/4fcea5b932ce
[3/3] arm64: dts: fvp: Add additional PCIe memory region
      https://git.kernel.org/sudeep.holla/c/d8e88ad6f769
-- 
Regards,
Sudeep


