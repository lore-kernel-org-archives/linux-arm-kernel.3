Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B74606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vDzx7m54;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rxsFuRQZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xw8Hc90SJ6hLK8A+mne32ZiLGjKs+f67UZdHxuK/A2M=; b=vDzx7m549CRkNliMW1Lffr3LH5
	HCdCHCtcJ4sIPfX+vgOWYRDLQbNOg9ErqMcypu3zM8a3sDk48iq7EUf0prcDSP1eP9zCNp3nrWuJX
	DCYJytowN4uW2+GL2S0yqLMZKdsar/jZk+OzDHMhx9v0y5Joq6sTwTPo/L0eSMmZCqnwSRl7lKufQ
	hZtmsn2bGB++3p/8mUIOYiXFnyRNa23jP2/xePkO/7cuvIbs4Ud2f8W3iw0HhOa+rrNgEIvtS7H+O
	aD86WdxQ0M2BecdvEpij7eQSjl1gqnWz0ffKHF+1aEHYwDOLO/T79Ph4dJ7Wq7J7i9TCOwhP0p/WS
	52xCEijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJurd-0000000EQ47-1rWq;
	Thu, 22 Oct 2026 15:37:57 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJura-0000000EQ3l-1Ii0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 15:37:55 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-486f013db83so907546fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792683471; cv=none;
        d=google.com; s=arc-20260327;
        b=FZ/a5FSt+KR12n9x11+7nzKUiMQlx+GTfJfpFLdFMwSnPBdVqKJrBWHgOJJ8n1x1n3
         4Umdr/2NET4XT5LH8XIjVl+4eq1LpH/d9LBn1CAx8u/H1qnJIG6JMZaiM/7w3y52Zm6R
         EgiaqFH8ygyeYn/QpJpiYJX9gIbsbYZso6ReryIcEGBR7NWkPYsw4EreOwjmMd3bTqJt
         +JxkrWGBgtU9kX0waa1Y6s1S44MpZ0hY0ZWFK3RyxlwN64IFNrlJ7zdyQVQGzfsvd/1v
         xb4py7sS+yH2JUnzQDGebxO1FZjSX2fyPwYG03SC/JZrowuGLMxCHwcACKuuKDMtif5E
         bZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=xw8Hc90SJ6hLK8A+mne32ZiLGjKs+f67UZdHxuK/A2M=;
        fh=uSLpJ05BtSQ0FI84S6eNnYNIKSjaXU2E8nKNr2hdqgk=;
        b=BKceNLrn4SmkekkBJIbCuptYo7WajB44a3H1/EPU6RtEKxtTR9BZwWdvDWn2lT+V9X
         7Rpc0OyMEGERRZEYQOmstTosFIm2WNdcowYFQ6ze4mRkIFLwsQZF6uUpZX14xIVF9xBX
         VSluKkF+VVswWorRb1K4A45GiaKHuuKU0Z4L/0glhwynmwEoTKf/LkdEyuxffb7+BZja
         uzITVB+/asgrBRgNQHd+eLZge6o3PEYk18Dt5Q29UFdOmnbP736KWDTKaKdP2SseKK0W
         cAU9v2IV98io/SmZFYBVUDgIWLzXHSUkrvR0l6OI6GobQ3LrGeRwiY5OEj+TB2RRi7Rq
         pO2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792683471; x=1793288271; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw8Hc90SJ6hLK8A+mne32ZiLGjKs+f67UZdHxuK/A2M=;
        b=rxsFuRQZW8mwlXU/0wRV8rIlHLba+ouNXYG35yKo3GUj57V/4EUqjYgv5dBOTq2nav
         0SqbqzcPeEyyXMAvzV/KFAM7J1bZ+C4C4lktj5jwQgL2DYrvejonyNU4WD76CwsSrcFy
         s1mi4GHXDzkdzqyXL/QqNVHpFgT9luSJCTivTdePJzph6Dcb8/FUQ756loly1ggx8oEo
         Wft5/lJRdNRZXiWF4W5FF+0vwXjtdLbTMtl3O1+8Z5JJhRThAoT3Ppb2BZa250c/hvYx
         dg5PPUJgGbNcSRoSrexwrwnSVnH53sdnnhFRMyBhM1DxuNxws7+646LWm99suSHU3z5p
         TIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683471; x=1793288271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xw8Hc90SJ6hLK8A+mne32ZiLGjKs+f67UZdHxuK/A2M=;
        b=RXWUzVSBxOHmbb3sZgLZngeGYQDkLiC7UUdTlILnqSvTk4xP4ZTDoccQyvFIFHsI0I
         S60zh8YPYmv+y7UnnjRxkjKjNWr86T8On7LuzjQ/dSHZIZGNbSX7DpX/YNmGwBEalsPy
         hgtToyF/I5OvTxXEXV171YGMfzSTFiqTe6V+00bZEhCCykJfiB3uBEomnYi+7FtoLQey
         e/tr9X/VUWSLMZFlZ1FCAvOxiL9Lq/i6gQWgsf2Ftr6qqy4HT/ZqTkmckDtojiJzAfKG
         CEjR4nDcduKK4PuHD36dShmkfiE5M2/kX1BxZpCbqET/ycS1cCcapKkT3aOwqT9OdvCI
         PVug==
X-Forwarded-Encrypted: i=1; AKwUvBxzddYoZN8opYUIo971dlOylgdTMv8C7RaVXMTyaOb7GJ+36difdmY0ERUNlm3EuE6vY1iFI/iLJlqBRp7Gt7ld@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6b23WJ39oQDmKnWtWP+XY11EYrAEG1saE4L6QeI2k3WQaJWQp
	Vb/a82eAqu7rwdVSKqHpTLZ2021yT85s1G1neBIPHekYmSiFkcVStCuVPSMDQkues/inwgbh+yF
	v69Ecv8IQkUOkN2enR66/ESi3ja6Jo+Q=
X-Gm-Gg: AYBFou267FXWa7WUchdMVD6A3a556qmz46niYkwAVajyS8s0LRpG9G+6TKZ53Gt3ome
	EJzfld2AkR1Iea7Ldj7QN1hDUhxYfte/H922D8dewyHAMIY2sIp08/rumNrDSRe89cb2RDo2m3p
	3m3v0eHHJTbOZ+YR8e0fDQw2WfgEVJ+XkDWjui75aT4IH+s8FjWrkDvHma5lhJkUYcjok4Os3rF
	vRZ1KO054/1aCDj1+el0bm0rKcYzr5OTSTLQmZcK11F1lHyet2KL/GLbKMfAmo75yyu81axJlQ4
	8Wvyhw6Irf4iVdgqnOibC5LAEAp6aq1YVEX0IGzhWE0L8MBLB1Qt5fbY2hVWuCkz4KigqG4bu7o
	nUBZ3Ea1hXE1175pjW1PweFD9WxScV/QnLyze
X-Received: by 2002:a05:6870:1705:b0:455:e6ea:bd8f with SMTP id
 586e51a60fabf-4a7dc221558mr3586262fac.16.1792683471524; Thu, 22 Oct 2026
 08:37:51 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 22 Oct 2026 10:37:40 -0500
X-Gm-Features: AclHuK_KO6DMzOAI40roeC_Oa2STIKdlEGirC5hdAD1SmKSOl6vW05usBpoKQCs
Message-ID: <CABb+yY2rFwmcxXvJSp9=QX5fwNSzhBvb-mz7Yu=4ddW6q_kpCQ@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v7.4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_083754_408010_78EEF36E 
X-CRM114-Status: GOOD (  16.24  )
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
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf78a=
:

  Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v7.4

for you to fetch changes up to 01a40ad5a9687ea5a837857d4b21ddd764be7aa3:

  mailbox: Use named initializers for acpi_device_id (2026-10-21 18:46:54 -=
0500)

----------------------------------------------------------------
mailbox: updates for v7.4

 - altera: shut down RX polling timer on channel teardown
 - arm-mhu: timeout if receiver never comes up in mhuv2, keep combined IRQ
    enabled during suspend in mhuv3, and drop redundant unregister on probe
    failure in doorbell
 - axiado: fix RX frame draining and error handling, and fix debugfs name
    truncation warning
 - bcm74110: cap rx_svc_init_list growth to prevent PMC-induced OOM
 - hisilicon: convert Hi3660 and Hi6220 bindings to DT schema
 - mtk-cmdq: fix runtime PM leak in cmdq_mbox_flush()
 - pcc: free channel before unmapping shared memory and serialize channel
    updates with teardown
 - qcom: guard against NULL con_priv race in IPCC send_data, use dev_name()
    for IRQ names, drop stray disable_irq_wake(), read 64-bit register with
    readq() in CPUCP, drop redundant unregister on probe failure, and add
    SDM670 and IPQ9650 APCS bindings
 - rockchip: prefix register defines, simplify device variant handling, and
    convert to use dev_err_probe()
 - ti-msgmgr: add TDA54 main secure-proxy support and DT bindings, read exa=
ct
    trailing bytes for non-word-aligned messages, and do not report RX poll
    timeout as a send failure
 - misc: use designated initializers for acpi_device_id across drivers

----------------------------------------------------------------
Anup Vishwakarma (5):
      mailbox: qcom-ipcc: Remove redundant
mbox_controller_unregister() on probe failure
      mailbox: arm_mhu_db: Remove redundant
mbox_controller_unregister() on probe failure
      mailbox: qcom-ipcc: Guard against NULL con_priv in send_data()
      mailbox: qcom-ipcc: Use dev_name() as IRQ name instead of a static co=
unter
      mailbox: qcom-ipcc: remove stray disable_irq_wake() call

Beleswar Padhi (4):
      dt-bindings: mailbox: ti,secure-proxy: Add TDA54 variant compatible
      mailbox: ti-msgmgr: Add ti,tda54-main-secure-proxy support
      mailbox: ti-msgmgr: Do not report rx poll timeout as a send failure
      mailbox: ti-msgmgr: Read exact number of trailing message bytes

Breno Leitao (1):
      mailbox: pcc: Free the channel before unmapping the shared memory

Christian Loehle (1):
      mailbox: pcc: Serialize channel updates with shared memory teardown

Finley Xiao (1):
      mailbox: arm_mhuv3: Keep the combined IRQ enabled during system suspe=
nd

Florian Fainelli (1):
      mailbox: bcm74110: Cap rx_svc_init_list growth to prevent PMC-induced=
 OOM

Linkai Gong (1):
      mailbox: arm_mhuv2: time out if the receiver never comes up

Pawel Zalewski (1):
      mailbox: Use named initializers for acpi_device_id

Richard Acayan (1):
      dt-bindings: mailbox: qcom: Add SDM670 APCS compatible

Rob Herring (Arm) (2):
      dt-bindings: mailbox: Convert hisilicon,hi3660-mbox to DT schema
      dt-bindings: mailbox: Convert hisilicon,hi6220-mbox to DT schema

Runyu Xiao (1):
      mailbox: altera: shut down RX polling timer on channel teardown

Sivansh Gupta (1):
      mailbox: qcom-cpucp: read mbox hardware register using readq()

Swark Yang (2):
      mailbox: axiado: fix RX frame draining and error handling
      mailbox: axiado: fix debugfs name truncation warning

Uwe Kleine-K=C3=B6nig (3):
      mailbox: rockchip: Add a prefix for register defines
      mailbox: rockchip: Simplify device variant handling
      mailbox: rockchip: Convert to use dev_err_probe()

Varadarajan Narayanan (1):
      dt-bindings: mailbox: qcom: Add IPQ9650 APCS compatible

Wentao Liang (1):
      mailbox: mtk-cmdq: Fix runtime PM leak in cmdq_mbox_flush()

 .../bindings/mailbox/hisilicon,hi3660-mailbox.txt  |  51 ---------
 .../bindings/mailbox/hisilicon,hi3660-mbox.yaml    |  57 ++++++++++
 .../bindings/mailbox/hisilicon,hi6220-mailbox.txt  |  74 -------------
 .../bindings/mailbox/hisilicon,hi6220-mbox.yaml    |  63 +++++++++++
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |   2 +
 .../bindings/mailbox/ti,secure-proxy.yaml          |   4 +-
 drivers/mailbox/arm_mhu_db.c                       |   4 +-
 drivers/mailbox/arm_mhuv2.c                        |   9 +-
 drivers/mailbox/arm_mhuv3.c                        |   6 +-
 drivers/mailbox/axiado-mailbox.c                   | 116 ++++++++++++++++-=
----
 drivers/mailbox/bcm74110-mailbox.c                 |  13 +++
 drivers/mailbox/mailbox-altera.c                   |   2 +-
 drivers/mailbox/mailbox-xgene-slimpro.c            |   4 +-
 drivers/mailbox/mtk-cmdq-mailbox.c                 |   7 +-
 drivers/mailbox/pcc.c                              |  11 +-
 drivers/mailbox/qcom-cpucp-mbox.c                  |   2 +-
 drivers/mailbox/qcom-ipcc.c                        |  20 ++--
 drivers/mailbox/riscv-sbi-mpxy-mbox.c              |   4 +-
 drivers/mailbox/rockchip-mailbox.c                 |  60 +++++------
 drivers/mailbox/ti-msgmgr.c                        |  65 +++++++++---
 20 files changed, 347 insertions(+), 227 deletions(-)
 delete mode 100644
Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
 create mode 100644
Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mbox.yaml
 delete mode 100644
Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
 create mode 100644
Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mbox.yaml

