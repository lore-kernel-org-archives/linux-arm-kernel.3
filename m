Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADD7C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=psWYm2H9AyU6tcCSv/QCflLAmPilw42Vzi6vK5pI7hs=; b=JIjfr+Xijm5zo09YKVcdHti3pB
	pcSIdNcvK2QJZOZyshMzetmaA787tnj3OVOk96mGyahW96QHAkfAh2hcLQnNaGt09ypTnAM2XEg9Z
	5FSwSO19J3/ox5tekYLr45SqeX1+AFhvYCs9iMKM+hsquoEnFkFYqegITzaV+4sWFbhdpHEcl1ehW
	a4jXeSnWZvd/Cb/bR7OXuwCIy+wMXJaNX/aAZdPSAapyzoM8w2Ke3iUIgcMk0qYCXBfw6/85K18vy
	obn5IB4oQE9J8FhKp67lt1vSsJLikUTrhn+MqsuBRcATa7k0fuCHZWYCtd9Bic3lK7XS9xIhXGqYr
	OgGdVmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZPq-0000000FqJq-0Nbv;
	Sun, 02 Aug 2026 16:51:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZPp-0000000FqJg-0LwH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:51:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45425601DE;
	Sun,  2 Aug 2026 16:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FC91F000E9;
	Sun,  2 Aug 2026 16:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689515;
	bh=psWYm2H9AyU6tcCSv/QCflLAmPilw42Vzi6vK5pI7hs=;
	h=From:To:Cc:Subject:Date;
	b=X6tax8HFSXE68l189gziI6nb/mV0+pDQZ5wSazKrSYAvJGmdzUYkfZNC9dQshO5TF
	 MH/wChIu7UgSuzxFxIWvXFopUhJOmcYbXjnZP8i9tqEDvaFTpNnrvObmD3YxykfKhC
	 6srcXd0kQMnH86AekL+P/7l3b6mvzXu70fFaAQeLBUJo5rDJPMHc1WNpBQEOyahAyv
	 3ZRVh84l+ZoiL8/yo3ecNoYZSy5AuzWwmqthgKi3l2TEWagEI8FwvqwT4JGfQvc2MM
	 gMeLvw5egNdqwgQgLGCGnldMbrO5Z1kTB+fSe/tS04wq8LqDqqV32U+lTxPDjcCsA8
	 nv3QdtiVwcKqg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] dt-bindings: Changes for v7.3-rc1
Date: Sun,  2 Aug 2026 18:51:44 +0200
Message-ID: <20260802165148.1259649-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
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

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.3-dt-bindings

for you to fetch changes up to f63ecc70c341682f2f78403be84069876d3eac0c:

  dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string (2026-07-31 17:35:47 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v7.3-rc1

This contains a few fixes for interrupt types and email addresses as
well as the addition of a compatible string for the Lenovo ThinkEdge
SE70 Edge Client.

----------------------------------------------------------------
Ashish Mhetre (1):
      dt-bindings: iommu: Fix interrupt type in example

Jiqi Li (1):
      dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string

Thierry Reding (1):
      dt-bindings: gpu: host1x: Fix email address

 Documentation/devicetree/bindings/arm/tegra.yaml                     | 5 +++++
 .../devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml        | 2 +-
 .../devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml        | 2 +-
 .../devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml        | 2 +-
 .../devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml        | 2 +-
 Documentation/devicetree/bindings/iommu/nvidia,tegra264-cmdqv.yaml   | 2 +-
 6 files changed, 10 insertions(+), 5 deletions(-)

