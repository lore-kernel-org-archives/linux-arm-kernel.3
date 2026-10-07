Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7257CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/n1lUVDvtISsTleobVdTsyOFDT6GSQkTBwpFcgRAnC8=; b=2P8bkYC4/pyuOAuMV8mivvxYPW
	e2fcDRtDAS7jciKvbgFoDgFNUvhn+iebrFA8DQoP4WnUwBWTL/3nOdtYaJqO/bmDS+POy8gwkdCNZ
	q5owBSTmA2oA22ZBXd8jxfAIcCwKKPhAqZQ7neEV54r9PHgY49tsErnHvoQmWQWuP0sc4xCE+VNpM
	WgpSk8zCZ+MmFA5zjumYKxmz9MfB0TvW2YXZdJ5N7X5hDRoJ4W0MumKewk57SiTkPc7GGkaQQV8i5
	P9ythWAPEE3uIVt/jyr06CGs/U7SSosZgIolHDeHvKbtv5NJHWk3MCyK2UpRco2y2yXn4k/8PDRJR
	PrDL4q+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESrI-00000002dh9-2jhU;
	Wed, 07 Oct 2026 14:43:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESrH-00000002dgu-3XTu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:43:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AB85460207;
	Wed,  7 Oct 2026 14:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FCD1F00899;
	Wed,  7 Oct 2026 14:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384182;
	bh=/n1lUVDvtISsTleobVdTsyOFDT6GSQkTBwpFcgRAnC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D19DlL2vkB4kKnw5dAaPXfrOq5sAnl9jZM4HXY7r2sKgr+j3y1VdssTZD84gNC4/g
	 Fx9A0Kn89atdHa51O7PDN37obJbG3F4am3TcPBAmYbdxqbUo5loXvDzPqf5ORq2134
	 N3UQND8+6/pLdehnQPrVxOvhpuqpyowiqi4XR4mpV2KBMBxiuXKZqHR6RImMNPj9Kg
	 3s3KMb71ejEX3pk2Yfn1m+pWkZ9GErAa4cq2NXvKqYAZzJzUeIik/ffQYny7TWB1kB
	 lozNx9q3D982Xptc8zeGkT3taKbiAGELHdImuvAVPj7rOPxFz6hpCq3yu09MySpS8q
	 DGv4pdfrdEJaw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: arm: corstone1000-a320: Fix GIC redistributor region size
Date: Wed,  7 Oct 2026 15:42:54 +0100
Message-ID: <179138411339.612937.17423612061368525577.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005210506.2118052-2-robh@kernel.org>
References: <20261005210506.2118052-2-robh@kernel.org>
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

On Mon, 05 Oct 2026 16:05:06 -0500, Rob Herring (Arm) wrote:
> The Arm Corstone1000-A320 has a GICv4 which means the redistributor
> region should be 4x256KB rather than 512KB. This issue didn't become
> apparent as SMP was disabled as a work-around in early versions of the
> FVP.

Applied to sudeep.holla/linux (for-next/juno/fixes), thanks!

[1/1] arm64: dts: arm: corstone1000-a320: Fix GIC redistributor region size
      https://git.kernel.org/sudeep.holla/c/5ac351938cae
-- 
Regards,
Sudeep


