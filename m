Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC49606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 01:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lf04sFZA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4OQcLQo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ptXlvNW8/crskkQMBa6hZkzMbQX1iTP4V/XcJqDvAkE=; b=lf04sFZAhntSZdSKimfECq3rsW
	wbTpfvSZFo52l4EHjZ0KuX2AJym880KtIaiAa1ZoP2xW2sZwAPf4tMJ6CwmDLcr4VMoJW4z0GQeAM
	TOIepJnKMyvph3MoSHLeiVOH5yqvuWlhJaO5xeEzjCmDzdFcIT/dAicZFQG8ho0I1smm6uZoIZSlI
	o9OC1wrp7D/sbhS9D9uCAE4fwSFP8hsE5LU3F+HGDQNWsj8/XTnDVS9XsYeLV+ZPeTuifhhEGaX30
	h1DTFDgB216giTXHgQOa3fSC51dgbvNtugmVEHfApvSkAwrq9qN/JtOobK/lSrlBbmU3OPymBXl4f
	3mfXGV8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKQ9p-0000000HIyJ-0uLH;
	Sat, 24 Oct 2026 01:02:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKQ9o-0000000HIxh-1vXS;
	Sat, 24 Oct 2026 01:02:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA93441521;
	Sat, 24 Oct 2026 01:02:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792803767;
	b=ZcuDZ0dnvXqSob6QcHrBX2ov7++gxoCUp7vJOtcZw9bn5CbXE4KFTK9Fh8MvfIkQ6cRr
	 uRNbQx9GLNRLMORYK4S/HxJK5bBxIsU5RrblYWM103gpEW3QdGHIEJUk9GogYCL5JUIk+
	 J0o/QOruZKg57fTvCjy3rr7TKbILdw2cLawhK9LsjYFXQNemqikHxSxIcb3Z1XXlCcAkh
	 SUQgvudKPEmhFNUHwwmDeoy6QYa7syybaPgqFPNRVjvmvfDv73PkyMhnSp5Uhx64/wdbI
	 w2vl3HyStT18PF9CtxfozStIfSDIbImwvMawyDA9SF9a+IPVqVAcVyn1HpjxWNahY6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792803767;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ptXlvNW8/crskkQMBa6hZkzMbQX1iTP4V/XcJqDvAkE=;
	b=Mjx0QR95vFx/ZhHWdBCB145WJCjPI/BBwD0R1VyA4mpTCdmkmRies/9iDgYlpYmW7R9K
	 Ql0A5DUGMa6tYiEMCuDACZxnNAqPsVx8vpd3fW6Sv3brFltyOOOTazg0WKFuF0rQYOj8A
	 FIxOxEfs91t55HR/UQIlwUFgTl73M+ZOL5OfMtoYh51Wx1dlUEL+AUYN/S48K119uphvD
	 inf7iD6trzq9tYxKEUjNj4GsBGVNslu7jNuh36B4rLIXT5uZe+/CEO1u50vNt3V3Rru/P
	 du91qvsQAHvWkLqMCoqs/xxWz/Lgv6vz2U/G2wvOjS2XcKmJ2duU+3un6FsWM3sjWKw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8BBC1F01828;
	Sat, 24 Oct 2026 01:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792803767;
	bh=ptXlvNW8/crskkQMBa6hZkzMbQX1iTP4V/XcJqDvAkE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=N4OQcLQoRaNY1gJ7N9jLgAxkzACLl9zjLeZm1BWj9c3HsHfcjjGV0POFpQxN50rDn
	 zcKBEcgwgJKJ135xUQb3NGQcTX9DGyPJaE+jDFXN7cUw4puBGedr9D3uFaQEkVzoMH
	 C2puHLgnOB3rdjrXnWo38yLrUFr2VxYHwvrJZosNgDrhBjI0VW8c9+RCzI2RHRfTHJ
	 qm4r6cINBQMlsJ0HpQFy2IDzBjpdbXmYLFoI3V5R+DPQsOx6juLdjxrdJnwsgfl/sW
	 1/rpJV7NDZqtg2jRPNUaqqRWy2asARKbSFv3aV8Nplg7B+DgJuBfkfByRgdcM22Sgk
	 aa9GUae+7D53w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 332A2446B9;
	Sat, 24 Oct 2026 01:02:46 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Subject: [PATCH RFC 0/2] PCI: rockchip-host: Retry training and hot-reset a
 JMB585 on RK3399
Date: Sat, 24 Oct 2026 04:02:42 +0300
Message-Id: <20261024-rockchip-pcie-resume-v1-0-58e54a5cf5f1@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALID3GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0ML3aL85OzkjMwC3YLkzFTdotTi0txUXaNkk5S0VCNjYxPDVCWg1oK
 i1LTMCrCx0UpBbs5KsbW1ACV2BXxrAAAA
To: Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=+J4t9tLH+2EYTg30VBIkqM2iIw1DwkZatrHsCOpjmlA=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFl3mLdUexyWM3bhtd3dmaqz3/Kgqe/ei+L8OuciSr6s4
 XuzrdK7o5SFQYyLQVZMkWXCIY1bGUuu/vX3MH8AM4eVCWQIAxenAEyE6RMjw/pZxZP5P9yZPE9w
 XhrzSgbj26LG9x6rZ0lqtWW2tal6bWb4n3bmVo9lnqtt83tVYbtimUMVcsJsIZ6iCuFfJXfonFj
 DDAA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

How should the host recover an endpoint that trains the link but does
not answer config requests? On RK3399 that read ends in an external
abort (an SError at probe, a synchronous abort on resume), and the
kernel oopses instead of seeing an absent device.

This happens on a Kobol Helios64 (RK3399, JMicron JMB585 SATA) with
v7.3-rc7 and the mainline DT, in two forms:

- link training times out on resume from s2idle (patch 1);
- the link trains, but a config read of the JMB585 aborts in
  pci_power_up() during resume, and during the bus scan at probe on
  1 of 4 boots (patch 2).

Patch 1 trains again after a timeout. Patch 2 hot-resets the endpoint
after training and waits the 100 ms required after a Conventional
Reset, so every RK3399 probe and resume takes ~105 ms longer.

s2idle with both patches:

  sleep    patch 1 only    both patches
  ~40 s    2 aborts / 30   0 / 100
  ~25 s    1 abort / 11    0 / 40, then 2 aborts in the next 3

In the last of those aborts the link came back 25 ms after the hot
reset instead of 2.8-2.9 ms, and the endpoint did not answer. We could
not reproduce that state on demand.

host_init_port() already pulses PERST# and waits 100 ms before link
training, so config reads start as soon as the link is up. Waiting 1 s
after link-up before the bus scan did not help: 2 of 2 rebinds aborted,
against 2 of 25 without the wait. That test ran without PERST# (the DT
had no ep-gpios).

The data is from the code as posted, except that patch 2 now also fails
probe and resume when the hot reset itself fails; that path was not hit.

Questions:
1. Is an unconditional hot reset after training acceptable, or should
   it depend on the board?
2. Can the host tell before a config read that the endpoint will not
   answer?
3. Is PERST# or a power cycle of the slot the expected recovery from a
   slow link after the hot reset?
4. Should the reset be a Secondary Bus Reset through the Root Port
   rather than PCIE_CLIENT_HOT_RESET_CTRL? We did not try it.

---
Igor Velkov (2):
      PCI: rockchip-host: Retry link training that times out
      PCI: rockchip-host: Hot-reset the endpoint before using the link

 drivers/pci/controller/pcie-rockchip-host.c | 88 ++++++++++++++++++++++++++++-
 drivers/pci/controller/pcie-rockchip.h      |  4 ++
 2 files changed, 89 insertions(+), 3 deletions(-)
---
base-commit: 732c4f7d2c04f8c175d85d9243213783ee024ebc
change-id: 20261018-rockchip-pcie-resume-2c4dfe23341e

Best regards,
-- 
Igor Velkov <iav@iav.lv>



