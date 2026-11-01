Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD660A2617
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xzDjp8EH;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=tireMB8b;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=dfBbLBAl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wEJnWzIAnou4pQH9tImVIhiTvGpOYOR1x4eAbFCRMDE=; b=xzDjp8EHzcY/aMzVpcwa9tJcCf
	TiGqt4DCwh8UjfuaRFY7y1veDSsrDC9KsudOLBm5vqQ9RQBXgRc/6rtdVbFljyXMIH5h7aFyIDtRu
	AjMYT5xIrHR2lHjUugir0v0J5w1KQl7jkVqI16aq3nulvBVMcPOcUdMWB5SW79JSL1PaL5/1qtKFN
	eQUGe9k5QrUKjBMwewKYkbTtx2w/iOCY9dRnZXb1CQzdXSOoULFnMwBbBjEVhs4a98w+kyf1rFqHx
	u9O04A5OjaVKnoII3jgtg18SoYbpfOWyHEkzPYPR69euOQADrtl/cQDBW+yFIwH+TZl3Vg72Eda0W
	C3cguyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexI-0000000FDro-3Lv8;
	Sun, 01 Nov 2026 23:27:16 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexD-0000000FDmE-1M7a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:14 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575631;
	 b=OcciJwHPLm5FX3bFG1eHET7unlLyKzEgCj4ujY+jwX4X89AWuUZdZPCMx7MusqpCRBO4NcAJ1a
	  9VEJaTwJ9DvxGcPyHERMc7RxwZ9tWaMv7gJKklESnO2Ck551YKKuNaxaUjG+x/XfC65Q3TpGka
	  GkIGR52QR/Kiz8KaNGsA5zLcrkMIte1ZHf3Th/7XWUoqyIyMVFM+L/vc+BriCqqNh08IHYrXrB
	  S6cawkj8ktUh++QdtIt/GhrtSFi+UtME8eFTnGcbL1E5Zkqo3EYK/IChKLoYIeaYaA5spVa6G/
	  0gD3ggpiJ5VSvLA8zB7ramBVFdWPlAMlb0LDH1xuxJl/LQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575631;
	bh=hjsHjvJdiVFb4MkP4Oih67FLGqThyQsQsUFshw2v5Gc=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=Sb9WCj8YxaxgAl1zT9KqysbUQO3K+89uHPF/0NQzCC+vfIVrqEMeXwAY7yzWUdUQfaMFTxDqGl
	  JZj/0htY32h2XKTSlW1HnCHlONbpv9jZHnt9LHbSgnoU7KLrnfvsS6jE4Ys+7rsV66tUBM8FU9
	  /dpfVhvlHqltFhiWQ7WmKnGR33aIrlg+RBjMQT1vPQJgmHKftXSP8OZ0xBhDvB/E6Cyg1j0SCX
	  FgZUWuBfvwsO5FN+dhouo208VOJm/4fFEvGUnZE91izZySGG3s19mqMJQFRJ841wyL7N3oiJhp
	  me4ZebiecaNGCuiOh8nKHbw93UCCa5JGn7JexUJgULERJg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=wEJnWzIAnou4pQH9tImVIhiTvGpOYOR1x4eAbFCRMDE=; b=tireMB8beVuFH5XKsS1MWg9JF+
	LJOlGZ6o5n/4KO9D9r+WIqNSMSYJQR6w+c4wPq4xJtQQ67Szh0ZxXMbggaRQpa6PpQcx4+J/Pncir
	MV25bLLIcPAN89a+iQSI/r3ULq7VLO6K/++aYbksKsV2gT1vMwSDRabhWFLJvTaE37Ss=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex6-00000005hrd-1diR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=wEJnWzIAnou4pQH9tImVIhiTvGpOYOR1x4eAbFCRMDE=; b=dfBbLBAlApgqTHmnycC+gRxNYT
	3Lw1gbuR/w1N5HvIB2yULgKIeJ5KQoMK0HZEx9GtqWiUulwLsA+qmqyKqNdzKWfEvh1YY0hjrhi5t
	hxqkMUjTqizWAfirhXvKVKxDlcthuRORvijdrFftE2pSvZPBlQZIlrM03Hiy7nj01Vi8=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNewv-000000002I5-3gcq;
	Sun, 01 Nov 2026 23:26:53 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH RFC v2 00/11] remoteproc: add support for any virtio device
Date: Mon, 02 Nov 2026 00:26:37 +0100
Message-Id: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2RqolIgnExM/wKshZKmLrAFK2
 tpoCP8uoFePbzIzbwRHlsnBIRrBUmDHpp9BbiLQDfZ3EnybGWQsszhPlLDUGU+DNboMbD2bssN
 BVLreSVQ1ViqFeTtYqvm1/l7hcj5B8Q3ds3qQ9svjUmvYeWPfqz0ka/knyv6IQiJicUO914qqF
 DE/Bmxb3LKHYpqmD2BW1sHQAAAA
X-Change-ID: 20260915-remoteproc_virtio_map-bcf32a5fab54
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Francesco Valla <francesco@valla.it>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8611; i=francesco@valla.it;
 h=from:subject:message-id; bh=hjsHjvJdiVFb4MkP4Oih67FLGqThyQsQsUFshw2v5Gc=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT23L87qZHNmzat6Kkx/SdGqZfksUb2u98u/Moosb3
 oju8l3p2lHKwiDGxSArpsgSsu7GvT1zzb+lbWB8BDOHlQlkCAMXpwBM5GI/wz91Rj+xQo7agCWv
 7NKnas4IO3ThVNZD3dvnUlNnmydPXlvC8D/hTqdm6+Jtcwy3xE75IPDqM2dMg/w7C4UZEZsPeLY
 81WUAAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 0f61fe799c02a44e16cbba6b6e3b07a9
X-AntiAbuse: ID - 0f61fe799c02a44e16cbba6b6e3b07a9
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNex6-00000005hrd-1diR-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_152711_538291_72519D39 
X-CRM114-Status: GOOD (  27.28  )
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

this is the second iteration of the patch series that introduces the
possibility to support generic virtio devices over the remoteproc
transport, whereas today only rpmsg and rproc-serial are supported.

Some introduction and motivation can be found in V1 [1].

This new proposal leverages the existing virtio infrastructure and its
optional usage of the DMA APIs to obtain the goal in two cases:

 - if the remote device is able to access the whole DMA space of the
   host, no special arrangement is needed; the DMA APIs will take care
   of cache management and (if required) DMA translation, optionally
   resorting to swiotlb if/when the buffers allocated by a virtio driver
   are not DMA-able;

 - in case the remote device and the host share only a small portion of
   memory (often the case for e.g. mixed-criticality systems), the DMA
   APIs can be coupled with a restricted-dma-pool area to force swiotlb
   translation for all the transmitted buffers.

The new functionality is introduced by setting the
VIRTIO_F_ACCESS_PLATFORM feature flag for all non-remoteproc-specific
virtio devices (i.e., all except the aforementioned rpmsg and
rproc-serial); this flag instructs the virtio framework to use the DMA
APIs when mapping and unmapping buffers to and from the remote
processor.

The series was tested against a custom Zephyr application [2] running on
the Cortex-M33 processor of an i.MX93 and exposing six different virtio
devices:

  - rpmsg
  - entropy (rng)
  - gpio
  - i2c
  - spi
  - can

== Open Points ==

There are still the following open points:

  - some virtio devices (e.g.: virtio-input) communicate through the
    device's config space. The remoteproc transport expects this config
    space to be somewhat constant, and there is no mechanism to sync
    changes made by the driver with the remote device.  

  - device de-registration on remoteproc stop is causing oopses (under
    investigation - might not be strictly tied to the series).

  - I still have to wrap my mind around DMA ranges and IOMMUs, and the
    way the remoteproc framework uses them; the current series keeps the
    legacy behavior for the first (i.e., DMA properties of the parent
    remoteproc device are copied to vdevs) and assumes da == pa for
    remote processor behind an IOMMU.

  - [i.MX-specific] the imx-rproc driver was sending messages in
    blocking mode; the change proposed in the series, required for
    proper operation in atomi contexts is sub-optimal and needs more
    work.

== Patches breakdown ==

Patches 1 and 2 are cleanups to the remoteproc-virtio driver and could
be applied independently of this series.

Patch 3 was submitted a couple of months ago [6] and paves the road for
the actual support of generic virtio devices, removing the fixed number
of 2 for the vrings associated to a vdev.

Patch 4 defines the VIRTIO_F_VERSION_1 feature for all
non-rproc-specific vdevs. This is required to support some virtio device
types, and there is no other mean of defining it, since the field
reserved for features inside the resource table is limited to 32 bits.
Given that the 1.x virtio specifications are ~10 years old this still
seems reasonable.

Patch 5 defines the VIRTIO_F_ACCESS_PLATFORM feature for all
non-rproc-specific vdevs. This is the first step required to obtain the
full virtio functionality.

Patch 6 introduces new devicetree bindings for declaring virtio
devices exposed by a remote processor inside a devicetree. This is not
required for some devices (e.g.: can, net, gpu), but for others (e.g.:
i2c, gpio) is necessary to declare child devices and link them.

Patch 7 assigns a fwnode (if existent) to each new virtio device and
assigns to it the memory region defined for such node.

Patch 8 expands existing remoteproc-virtio documentation to explain the
possibilities introduced by the previous changes.

Patches 9 and 10 are i.MX-specific and enable the usage of the newly
introduced support on this family of platforms. The first one might
probably be submitted independently of the series, since it aligns
the behavior of imx-rproc to the other platforms in relation to
mailbox usage. However, having a kmalloc in the hot send path is
sub-optimal. **Advice needed here.**

Finally, patch 11 is the PoC that has been used to develop and test the
series and shall not be merged.

======

Thanks to everyone that commented on v1 - the functionality evolved in a
much more flexible and no-nonsense way. Thanks in advance to whom will
do the same on this revision.

Regards,
Francesco

[1] https://patch.msgid.link/20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it
[2] https://github.com/WallaceIT/zephyr/tree/multi_vdev

---
Changes in v2:
- Rebased on v7.4-rc1
- Drop the custom .map APIs and rely on the virtio framework to perform
  DMA management and (if required) the bounce buffering [Robin].
- Set the VERSION_1 and ACCESS_PLATFORM features only for
  non-rproc-specific virtio devices to preserve existing usecases.
- Add the possibility to have a memory-region property in each vdev's
  node and use it for DMA allocations / swiotlb.
- Drop the new DMA subsystem APIs (no more required).
- Drop the spi-virtio bindings, which are not critical for the series
  and have been submitted independently [Mathieu].
- PoC i.MX93 FRDM dts: drop the virtio/spi node and child devices and
  move from gpio-keys-polled to gpio-keys.
- Re-introduced the rsc-table in PoC i.MX93 FRDM dts.
- Fixes in the remoteproc-virtio bindings [Rob].
- imx-rproc: drop unneeded rework of reserved memory assignment.
- imx-rproc: do not send async mailbox messages with payload living in
  the stack.
- Rephrase and expand commit messages.
- Document the memory allocation behavior.
- Scattered fixes for minor issues [Mathieu and sashiko].
- Link to v1: https://patch.msgid.link/20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Francesco Valla <francesco@valla.it>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Francesco Valla <francesco@valla.it>

---
Francesco Valla (11):
      remoteproc: virtio: cleanup rproc_add_virtio_dev error path
      remoteproc: virtio: replace commas with semicolons
      remoteproc: virtio: support dynamic number of vrings
      remoteproc: report VIRTIO_F_VERSION_1 for non-rproc-specific vdevs
      remoteproc: virtio: report VIRTIO_F_ACCESS_PLATFORM when required
      dt-bindings: remoteproc: add remoteproc-virtio
      remoteproc: assign fwnode during vdev registration
      Documentation: remoteproc: expand virtio support section
      remoteproc: imx_rproc: always use non-blocking mailboxes
      dt-bindings: remoteproc: imx-rproc: support virtio
      PoC: arm64: dts: imx93-11x11-frdm: add multiple vdevs

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   3 +-
 .../bindings/remoteproc/remoteproc-virtio.yaml     | 106 ++++++++++++
 Documentation/staging/remoteproc.rst               |  99 ++++++++++-
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 188 +++++++++++++++++++++
 drivers/remoteproc/imx_rproc.c                     |  76 +++------
 drivers/remoteproc/imx_rproc.h                     |   1 -
 drivers/remoteproc/remoteproc_core.c               |  55 ++++--
 drivers/remoteproc/remoteproc_virtio.c             | 110 +++++++++---
 include/linux/remoteproc.h                         |  10 +-
 9 files changed, 558 insertions(+), 90 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260915-remoteproc_virtio_map-bcf32a5fab54

Best regards,
--  
Francesco Valla <francesco@valla.it>


