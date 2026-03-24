Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8A1F532E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/RNJIUr4UGOAyu2wCZu18rKF108DiBXn8MXMHent60=; b=FU+Uq6F+qj2F20qlmhRFr0rwtn
	kK8oSfElcXlzzOGfrZoE7fgpnmzChCSfruvqEhJ1lenRfTCobfxv1AAatzjgyXgrQPmIlXgdRqEaM
	sydmjK2iZKlfahPwc+4y9L8FyiXDHPUhOMC1apsAbr/s6+w6lsZJCsBgKnh8t+kU2Gt0DI7p8sRjv
	YwcCACnIHqgtyaGnKiLdu/CsrOpuzYhLscGJpeNQLVnhd4ME1oVdAoEJN9DFJOmivJ9Sr43uabThk
	q2cgOHI35k0k8bEs2cD4EWracvYu0dGVaemBao9kDIpIvsv6huAgz3Fu20boAJihvdNLz6/DeLTWN
	26TII/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wEx-00000000tVv-0Mzy;
	Tue, 24 Mar 2026 07:31:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wEv-00000000tVe-3oRD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 07:31:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79898600AC;
	Tue, 24 Mar 2026 07:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D7FC19424;
	Tue, 24 Mar 2026 07:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774337508;
	bh=78iPV2L5TMsaJOeMoG4OcYMZODPjNSNMXHg4QJLAJcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dzo4pChVpkYklj4HxjUfE8vj1s1WObxUbHDX3p3jnYRosOdQb5JIf9PQY0VA4JkEQ
	 38Di7xSsE+Hdj9HjumIyXaQ8UE8Xnh44K4w4ZZA9hq3TSUruJ9OrI80APISNbBywDH
	 8FhFh6mhkC+N7kVnTH4ww9jR5f0iH2/Mz+tzSGllNUJN9QqKhYZ3HVFvUt4TiGFO2i
	 veH7jhzIf0M/YRq8KXEZ4Rh0UYUGYUeLo6q55SvO6LiOTIdRDPVu2NWeDp2gzjTz9o
	 kz3ErjmWjb0tWkaTJie8K0ojs2IaLZaBXQRq5gEx2I6V+FNERd34TUR0kIthOIIZx9
	 8BMLkA46v0wXQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Frazer Carsley <frazer.carsley@arm.com>,
	Hugues Kamba Mpiana <hugues.kambampiana@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] arm64: dts: Add Corstone1000-A320 platform
Date: Tue, 24 Mar 2026 07:31:41 +0000
Message-ID: <177433744044.1351878.7906196605172930598.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
References: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
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

On Fri, 20 Mar 2026 11:47:13 -0500, Rob Herring (Arm) wrote:
> The Corstone1000-A320 is a new Corstone1000 variation with Cortex-A320
> cores and an Ethos-U85 NPU. This series adds the new compatible strings,
> restructures the .dtsi files to handle the common parts, and then adds
> the new Corstone1000-A320 FVP platform.

Applied to sudeep.holla/linux (for-next/juno/updates), thanks!

[1/5] dt-bindings: arm,corstone1000: Add "arm,corstone1000-a320-fvp"
      https://git.kernel.org/sudeep.holla/c/f9d162866f2f
[2/5] dt-bindings: npu: arm,ethos: Add "arm,corstone1000-ethos-u85"
      https://git.kernel.org/sudeep.holla/c/55de145c8ec2
[3/5] arm64: dts: arm/corstone1000: Move cpu nodes
      https://git.kernel.org/sudeep.holla/c/903528ac234a
[4/5] arm64: dts: arm/corstone1000: Move FVP peripherals to separate .dtsi
      https://git.kernel.org/sudeep.holla/c/9c3904f94fdb
[5/5] arm64: dts: arm/corstone1000: Add corstone-1000-a320
      https://git.kernel.org/sudeep.holla/c/87599f1843d3
--
Regards,
Sudeep


