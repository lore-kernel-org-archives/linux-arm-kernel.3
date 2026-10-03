Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39376CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P3afzIZFLbpKaON2kpJxPPKXtSWU1Ph/FvDwlHtFc9Y=; b=W2n2tpuLMj2cnwqROslwnbj/G9
	M163czY3koF5VYDNszVhEm4JzfrWdW3GMEXtzve9ugXMP3UjWhCcMFk/IipwHNwWAMbAmwacUSytQ
	biwXV7RJNLT2SVQlEeoHS7zgJvUtqdVKD9HeGB32TywO54bkcqGotyGUsXf1KyMCkrUcthk38r2Mp
	iNH5vuzVzBY07gqKnJG73ozXqmO0gw4CE4VCUXb/C+iipG1pqPs0ti0tnx9594VnjOSPYg3Ryd5Fw
	25B5VUAtZ7cFM21M04fdMzXevXhAs04g6UHd7AeAjdQkhJi+KRueilPWcxVx9omCT1rzgTuzuF0Rj
	0+H9L4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWf-0000000DJcI-1Gpg;
	Sat, 03 Oct 2026 09:59:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWe-0000000DJbx-0QBs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:59:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C3A560D82;
	Sat,  3 Oct 2026 09:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5201F0089B;
	Sat,  3 Oct 2026 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021567;
	bh=P3afzIZFLbpKaON2kpJxPPKXtSWU1Ph/FvDwlHtFc9Y=;
	h=From:To:Cc:Subject:Date;
	b=F+wEVs18jg0US1SSIgzSUD9bH/WU+qaTSvpZPBSUP/Ql85miX54WEcHAQuIbIp+Nh
	 xWu7H8pkEsSA1d+8yk1fhP9M/PKIRJ9tOyLUjeTWqmXIY40oEMPgzx7Lhgn/SQOATD
	 SilEOI4kTrw2UFU9si0oQg4aohd72QJQQHbHMYH7ZJk3GPzLh8TXGHOcMJUqDxrk0P
	 tTWRGYZuZ6fBCJFOQO6uUlyyveUokKUwsGGbgZKodmA8e6PQ398MYEkFCH6eGjYxOz
	 dfi6ejckY8e6Rwpu8lK4FUNdy+heb83jmG8i//ZiK94Eu+9DRP63K7ZKE/J255MJPK
	 btNrWpzASzjUw==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/7] Device tree bindings changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:16 +0200
Message-ID: <20261003095924.1370238-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-dt-bindings

for you to fetch changes up to 8370532640fa15b9480ba19af9314d3266c92aef:

  dt-bindings: soc: tegra: pmc: Document Tegra210B01 (2026-10-03 00:39:13 +0200)

Thanks,
Thierry

----------------------------------------------------------------
Device tree bindings changes for v7.4-rc1

This contains a minor fix for the Tegra132 external memory controller
bindings as well as additions of compatible strings for Tegra264 and
Tegra210-B01 to existing bindings. Also, the new Motorola Artix 4G and
Droid X2 devices are documented.

----------------------------------------------------------------
Aaron Kling (1):
      dt-bindings: soc: tegra: pmc: Document Tegra210B01

Svyatoslav Ryhel (1):
      dt-bindings: arm: tegra: Add Motorola Artix 4G and Droid X2

Thierry Reding (2):
      dt-bindings: memory: tegra: Fix Tegra132 compatible string
      dt-bindings: fuse: Document compatible string for Tegra264 FUSE

 Documentation/devicetree/bindings/arm/tegra.yaml               |  6 ++++++
 .../devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml          |  1 +
 .../bindings/memory-controllers/nvidia,tegra124-emc.yaml       | 10 +++++++---
 .../bindings/memory-controllers/nvidia,tegra124-mc.yaml        |  1 +
 .../devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml      |  5 ++++-
 5 files changed, 19 insertions(+), 4 deletions(-)

