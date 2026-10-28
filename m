Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3105560A5BC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HKqJmDo5;
	dkim=pass (1024-bit key, unprotected) header.d=ilvokhin.com header.i=@ilvokhin.com header.a=rsa-sha256 header.s=mail header.b=scmphY3W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=K5LKyQgYKwl4SQBjA15TdSBAX9bbXAc3tVQHLRXEih8=; b=HKqJmDo5Qw/RvtenU6syz+U+dz
	CHuupMD1LT/N5ZNUCnY5BjXS27s9St7GpRHQelgBr45pN6LRGZ/j35IuNRWofNu0EOUWei8XEkP87
	f0S/OoTLydbyEARvlzF3wkC6KPlS7MQlbdcWcps4HDC4vh+pdpxq2IMag+CDnF0epS8ojBr9ltZRe
	jZyQqpbxq20OiysCnXkn2E0Ll7+oLNh0PeAHRRV+fxJRQIkCNZqCnttqV/PNIFxIrlZSVgBl6l1+I
	x00KyOzUNjC5Jahzw/0V0dWapcvQirJbNAoR3Vs+xeknwZq1P1vMcBTMYdfwuK4PDIe+HTAQLAA5N
	eeVpfpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLyts-00000006Wrq-0m87;
	Wed, 28 Oct 2026 08:20:48 +0000
Received: from mail.ilvokhin.com ([178.62.254.231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLyti-00000006Wiz-0Vbd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 08:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1793175633;
	bh=K5LKyQgYKwl4SQBjA15TdSBAX9bbXAc3tVQHLRXEih8=;
	h=From:To:Cc:Subject:Date;
	b=scmphY3Wunrsmp+34WEVPizPYNuER4OuyqQN+7wcAk8b243s6Ql6ZgZzt2Q3H2Zn3
	 fwtCXvfv3lUFbjuEGdD5xIfcK8QirvUz/AoB8DzMfhdVnF9ZGl/3QyMwT3LvSHQOfV
	 tYEhcDcVdgbtrWL1qNZRxMyUJGS6xrDDGVIAFe9A=
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id E3225FBCE3;
	Wed, 28 Oct 2026 08:20:32 +0000 (UTC)
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-hardening@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [PATCH 00/10] treewide: switch to __nonnull_args() macro
Date: Wed, 28 Oct 2026 08:19:39 +0000
Message-ID: <cover.1793027261.git.d@ilvokhin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_012038_348956_4A747FD8 
X-CRM114-Status: GOOD (  11.79  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 22302af28d3f ("cleanup: Annotate guard constructors with
nonnull") added the __nonnull_args() macro to wrap the raw compiler
attribute, keeping the attribute's quirks in one place rather than
open-coded at every call site.

This series replaces the remaining open-coded __attribute__((nonnull))
users with __nonnull_args() to standardize nonnull attribute usage
across the tree.

Each patch can be applied separately by the respective maintainers. The
only dependency is kernel-doc: the string and lib/list_sort patches need
patch 1 ("docs: xforms_lists: support __nonnull_args()") in the same
release, otherwise strends() and list_sort() drop out of the generated
documentation.

Latest Sparse release could not properly parse __nonnull_args() without
arguments. Fix was proposed [1] and merged, but until updated version of
Sparse will reach wide masses it might trip on __nonnull_args() without
arguments.

There are few more instances of __attribute__((nonnull)) usages left in
the tools subdirectory, they are perf related copied files and can
(should?) be updated separately after this patchset lands.

Build-tested allmodconfig with GCC 11.5.0 and clang 22.1.8.

[1]: https://lore.kernel.org/all/20261019175633.415493-19-bvanassche@acm.org/

Dmitry Ilvokhin (10):
  docs: xforms_lists: support __nonnull_args()
  string: Switch to __nonnull_args() macro
  lib/list_sort: Switch to __nonnull_args() macro
  xarray: switch to __nonnull_args() macro
  drm/i915: switch to __nonnull_args() macro
  drm/amdgpu: switch to __nonnull_args() macro
  drm/gem: Switch to __nonnull_args() macro
  leds: pwm: Switch to __nonnull_args() macro
  soc: aspeed: lpc-snoop: Switch to __nonnull_args() macro
  checkpatch: suggest nonnull attribute conversion

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 4 ++--
 drivers/gpu/drm/i915/i915_request.h        | 4 ++--
 drivers/leds/leds-pwm.c                    | 2 +-
 drivers/soc/aspeed/aspeed-lpc-snoop.c      | 4 ++--
 include/drm/drm_gem.h                      | 2 +-
 include/linux/list_sort.h                  | 4 ++--
 include/linux/string.h                     | 2 +-
 include/linux/xarray.h                     | 4 ++--
 lib/list_sort.c                            | 6 +++---
 scripts/checkpatch.pl                      | 3 +++
 tools/include/linux/compiler.h             | 4 ++++
 tools/lib/python/kdoc/xforms_lists.py      | 1 +
 13 files changed, 25 insertions(+), 17 deletions(-)


base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.53.0-Meta


