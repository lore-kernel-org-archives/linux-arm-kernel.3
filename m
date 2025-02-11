Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAFCC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 06:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ltodfpoTo/efO2g20yMTGCnJ1x3Bz5NgxNfCtodt92o=; b=knPfjxTDxvXvmgsi7Q89MHF2a/
	vjlMirTwgFVPTVpnky3wJ69CJPxvRhYlYLxasSWQinXO608Xy1LaKQu3Admjf3lD965cgcbwSZWwK
	tZvvURfrDUuJz6qHxUGucj2BOKq78bOQuaSe0bPqAvZyj72qIDInexhlsWtLFXmzxvSSSQ7gfGa/M
	CGSyLnaMrdJ8aSfAmmI9eVHxAURPuFam9pctqXRVb5suhAngUgyskAFjF7CjNAaRAol3e6IrSGe3X
	HOQbv9od1sZlNJ6OANOR0EUa6+M2KbIIPIVwJQeRZ4hz1VbJ6DR+iM085+cSrwKBveSHhP/17Kh2O
	d0csBoog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thjhL-00000002h8n-0pok;
	Tue, 11 Feb 2025 06:24:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thjfv-00000002ge8-2UWs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 06:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52EB2A400E4;
	Tue, 11 Feb 2025 06:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE8DC4CEDD;
	Tue, 11 Feb 2025 06:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739254994;
	bh=OO6X48oMD1uFUOD5elmk8YCfoS/Rml763B+Am/9mOOc=;
	h=From:To:Cc:Subject:Date:From;
	b=iyPX0pA5AG6JuBzDJhoXbZm+u09Ly/vfgxYiqyrlnGOKVFWTfN0tWWiye88LDOJmE
	 c8JfHUTrSEZmaEtOvb/llUXNoV2N1SOezBdAxjaxY9MWPyYTi7d1a/ZJk4hCw5MV0y
	 f+ESJmKKg+iFde9Y624LY1xVA0zJCa7XK+SO6clqtDSfwIcScP3r4rg0nLgaheFUKg
	 +JU00b3Xt7KGFVF/+alS8Y5/JgNy7eBzsy+E3IdHJdCPGpK1f1K6aTwfofhNil67UR
	 gqEmNdJH7Tpyg22fEsFX4yPqk9j9y5quz3jbQjxqM/ctDs0YsMovmUbLJESmPvJd8m
	 nX60ELz6H60WQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thjfs-00000008YBE-2xQJ;
	Tue, 11 Feb 2025 07:23:12 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Alex Shi <mchehab+huawei@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Carlos Bilbao <mchehab+huawei@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Eric Dumazet <edumazet@google.com>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Jakub Kicinski <mchehab+huawei@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Young <sean@mess.org>,
	Simon Horman <mchehab+huawei@kernel.org>,
	Will Deacon <mchehab+huawei@kernel.org>,
	William Breathitt Gray <mchehab+huawei@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH 0/9] Extend automarkup support for ABI symbols
Date: Tue, 11 Feb 2025 07:22:54 +0100
Message-ID: <cover.1739254867.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_222315_760952_BB3E49C6 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

Now that ABI creates a python dictionary, use automarkup to create cross
references for ABI symbols as well. 

Mauro Carvalho Chehab (9):
  docs: media: Allow creating cross-references for RC ABI
  docs: automarkup: drop legacy support
  docs: thunderbolt: Allow creating cross-references for ABI
  docs: arm: asymmetric-32bit: Allow creating cross-references for ABI
  docs: arm: generic-counter: Allow creating cross-references for ABI
  docs: iio: Allow creating cross-references ABI
  docs: networking: Allow creating cross-references statistics ABI
  docs: submit-checklist: Allow creating cross-references for ABI README
  docs: translations: Allow creating cross-references for ABI README

 Documentation/admin-guide/thunderbolt.rst     |  2 +-
 Documentation/arch/arm64/asymmetric-32bit.rst |  2 +-
 Documentation/driver-api/generic-counter.rst  |  4 +-
 Documentation/driver-api/iio/core.rst         |  2 +-
 Documentation/iio/iio_devbuf.rst              |  2 +-
 Documentation/networking/statistics.rst       |  2 +-
 Documentation/process/submit-checklist.rst    |  2 +-
 Documentation/sphinx/automarkup.py            | 47 ++++++++-----------
 .../it_IT/process/submit-checklist.rst        |  2 +-
 .../sp_SP/process/submit-checklist.rst        |  2 +-
 .../zh_CN/process/submit-checklist.rst        |  2 +-
 .../zh_TW/process/submit-checklist.rst        |  2 +-
 .../userspace-api/media/rc/rc-sysfs-nodes.rst |  2 +-
 13 files changed, 32 insertions(+), 41 deletions(-)

-- 
2.48.1



