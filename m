Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37246606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 01:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cj67SL5A;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=by21JAX5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qz2KgSvxs/QubGSn6ctkR3NuYfESAeObXcUr3tbspdM=; b=Cj67SL5AfXUjQB
	JU5SUCXG2F4h9m78Tf4JcEx/nK9UlReppZlnWRZ/C+GWHpLwOsPIQ4TUtpCeRbJZA3KlwAn0p4yvh
	58oM8oT5eQ2V/fQ+gXo8IZpbIsZdlF9d0LJHsu8n1r6xgVVwRgMlHNmakvFyMkRzVvK5udNAV+O3C
	x5K9hvHb2ZfaCFUZ8yygF15fm2CmChCE226FfrRa6hC/3n+X6U2KIfehzq4RduWiYxzinvbtbStHO
	gLBnfpHJK6yRTRnK2jQQ1rPqb+urdv2hL1GMhWb4WKe6mjJ8joNN7g7rs01C5bWVCcND43nr6gnR9
	IJzB0ZT3g6YkO/JCpI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmXL-00000007VQO-3sb1;
	Thu, 05 Nov 2026 01:45:07 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmXI-00000007VP4-2Owe;
	Thu, 05 Nov 2026 01:45:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793843096; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Yuofk1O36nbwUk0teyUxBHcwFtB6oYbW8laHO1bPwqKjuaUVxh2pNk2cVRd6reWo2zokw7ekbkYk7qPOcBooOIq8RGAFinerkkj/EfmgsW9z70wMYNWznUIrZuY2OBIfiQfzpfEJQdmRU0X0e/4zPaI92fEqGq/CAfZmw8zBBNM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793843096; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Qz2KgSvxs/QubGSn6ctkR3NuYfESAeObXcUr3tbspdM=; 
	b=cAqXRxjmIvDH9BHAkZOnilJaKMfbXcp+dX49vSKTW+vO6w8mErwWQseqw9YeV33p1StRXSVYMbce7q2+rRuGn2FYJpL68+OTG51tzfrP/L68GQBNbPf8MYSf+Q8nXLEIt7Dc73N94S+GCQzTgba/iHXgqY+oP4YFhfCRgW3h8dk=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=by21JAX5eS17IyPINnm3VUQLZdKacWLqLKfQqeNoPP+8mDh++WkkOA5DPxoDEywi2BQ1NgJXLJHkXLgv4NVRPbZ8hI1cJLWEgQcOBhn2J/qblujzvpAjDH/ehWy//ktm9ZEMGuuaI9akOSWIgfgOpygsDkfjvpuyuuqyXN7dKR8=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Qz2KgSvxs/QubGSn6ctkR3NuYfESAeObXcUr3tbspdM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793843093919792.6849770156605;
	Thu, 5 Nov 2026 02:44:53 +0100 (CET)
Date: Thu, 05 Nov 2026 03:44:52 +0200
From: Igor Velkov <iav@iav.lv>
To: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
Cc: iav@iav.lv, shawn.lin@rock-chips.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 heiko@sntech.de, dlemoal@kernel.org, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] PCI: rockchip-host: Make the PERST# inactive delay configurable
Message-ID: <20261105-ehbello-perst-v5-tested-by-1@iav.lv>
In-Reply-To: <20261104215848.2087944-1-ehbello@gmail.com>
References: <20261104215848.2087944-1-ehbello@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_174504_883632_1F4624C1 
X-CRM114-Status: UNSURE (   4.46  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on Helios64 (JMB585 behind a GPIO-switched slot supply) and
ROCK Pi 4A (empty slot and a WD SN770 NVMe), 7.3.1 with the series
backported, one s2idle cycle per boot:

  Helios64, no property:          resume 20/20, abort in rockchip_pcie_rd_conf() at probe on 1 of 21 boots
  Helios64, <10> probe and s2r:   resume 20/20, the same abort on 1 of 21 boots
  ROCK Pi 4A, empty slot, none/<10>:  10/10, 10/10
  ROCK Pi 4A, SN770, none/<10>:       10/10, 10/10, NVMe readable after each resume

The default behaves as before, and 10 ms changes nothing here; the
slow JMB585 link on Helios64 shows up at the same rate with either
pulse width.

Tested-by: Igor Velkov <iav@iav.lv>

