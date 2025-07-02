Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDC4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScBH3hkvCTE7zxSw4L4Qc2r7b0Te6LFJd2k/HPFhb5o=; b=YXXw6ZMI4Vyz3xHu9ytjodGWSz
	up+z1yHoEr6c9bjqXkW+W/x+ffEmhv91kBONONuKfY+1Ykkb37MTAi7v/V2dCCfZgOUHJo2EQrYLo
	kW0HZLyv/i71NfUbccxOU655qdg8HF8CwlufU7p0l8UQNV3h+WZX5SIUI+cjxvKs53GkaPeV7wooi
	bfFQXoDZw9j7WuVadw8cDCsy7MDi8pSVK3ljrgd+fsKhklvWP0qH/p+Kb6x/ADFzB0yiHb2jkHR5O
	UPGAS2lQuqJ5/63ovpsY2VZbWsLUxkRYj6xTQMkAc2OJJ3fZDbmX6LA2S8tgvOpGGU0wj8dmdtzsf
	gh/0lonw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyKm-00000008c3z-49A7;
	Wed, 02 Jul 2025 14:21:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxBE-00000008Oa8-3Kd0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 13:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ScBH3hkvCTE7zxSw4L4Qc2r7b0Te6LFJd2k/HPFhb5o=; b=evDF3iEHUe7/B90zHzAWC7p74i
	N8cq0QzQzovRz7dsDhdu+qWE3SrnMvaAeSlYGrOwoff2hav8qUrwZqtKF8PppuA0udItOzmWudwIX
	GSAaTmpXvFQ7Xk2K++xVD8dLgFocAmiM1OooUDyyChBwNwGNV2Ccb28Cbcv2mPLZpA7+T1cgeeD+8
	gRHf/3gdprxZ6x0Vh0Xkq9a8T+HxJChJWI8A1XUlLZv66M+7P52ZQept9jcYDHa8NqQT0JqvyYRsd
	byTi0pKhd/ZGyCrfGBVnBGwJm9QgdgCa7fiSPDTKuMhJsVLDQE29+/hV8bGuGFs+7mzoQgR7bZVss
	mrSZBUbA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxBB-00000007OLf-2PtQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:07:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 79A87A535AE;
	Wed,  2 Jul 2025 13:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7AEC4CEED;
	Wed,  2 Jul 2025 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751461632;
	bh=gf2sQbHcLAupqATPVKtpgXGyK+779f5rPVv4yhPoP3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHF+p8acu21kpFfa5z6AeaF7zGgAsr39mm4n3xlsl5wUuJ79NVHx2Oe/kutY+WUIQ
	 1zF6CA6DLLvbtpi9yAGn2+bb8AuUpOhoxr7Kcyhh/4gsgTGZxTQsvyVRmXE1fuEiER
	 PHL8sZdkO1nBlT95ybIDoRAuXZoauuvxOFZl+ybl/URXhuy3/OxJFdPKIsMbwDV1B9
	 5Q29UpAe6G4B9HTThjaMnddlgSM+O8oMwI+wGdrkeWWY7Y9yBa/SbBANwtM2gpqUc7
	 Q3bqS7HFZFsXLXlzXCBcETCRdzbPaDEa/eyuDKvU1fbcKfGRAm8FV+TrLb1uYa3L/X
	 GK9ee/icUL3Ww==
Date: Wed, 2 Jul 2025 18:36:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 05/10] PCI: endpoint: pci-epf-test: Add doorbell test
 support
Message-ID: <357zznvglssmaemq4j3v3s4atrkljq3o6ivx35h3ztw64iml3d@hauozlcoaaog>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-5-77362eaa48fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-ep-msi-v19-5-77362eaa48fa@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_140713_979810_CBED5BFA 
X-CRM114-Status: GOOD (  18.65  )
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

On Mon, Jun 09, 2025 at 12:34:17PM GMT, Frank Li wrote:

[...]

> +static irqreturn_t pci_epf_test_doorbell_handler(int irq, void *data)
> +{
> +	struct pci_epf_test *epf_test = data;
> +	enum pci_barno test_reg_bar = epf_test->test_reg_bar;
> +	struct pci_epf_test_reg *reg = epf_test->reg[test_reg_bar];
> +	u32 status = le32_to_cpu(reg->status);
> +
> +	status |= STATUS_DOORBELL_SUCCESS;
> +	reg->status = cpu_to_le32(status);
> +	pci_epf_test_raise_irq(epf_test, reg);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void pci_epf_test_doorbell_cleanup(struct pci_epf_test *epf_test)
> +{
> +	struct pci_epf_test_reg *reg = epf_test->reg[epf_test->test_reg_bar];
> +	struct pci_epf *epf = epf_test->epf;
> +
> +	if (le32_to_cpu(reg->doorbell_bar) > 0) {

Is this check necessary?

> +		free_irq(epf->db_msg[0].virq, epf_test);
> +		reg->doorbell_bar = cpu_to_le32(NO_BAR);
> +	}
> +
> +	if (epf->db_msg)

Same here.

> +		pci_epf_free_doorbell(epf);
> +}
> +
> +static void pci_epf_test_enable_doorbell(struct pci_epf_test *epf_test,
> +					 struct pci_epf_test_reg *reg)
> +{
> +	u32 status = le32_to_cpu(reg->status);
> +	struct pci_epf *epf = epf_test->epf;
> +	struct pci_epc *epc = epf->epc;
> +	struct msi_msg *msg;
> +	enum pci_barno bar;
> +	size_t offset;
> +	int ret;
> +
> +	ret = pci_epf_alloc_doorbell(epf, 1);
> +	if (ret) {
> +		status |= STATUS_DOORBELL_ENABLE_FAIL;
> +		goto set_status;

I think you can just set the failure status directly in err path:

	if (ret)
		goto set_err_status;

> +	}
> +
> +	msg = &epf->db_msg[0].msg;
> +	bar = pci_epc_get_next_free_bar(epf_test->epc_features, epf_test->test_reg_bar + 1);
> +	if (bar < BAR_0 || bar == epf_test->test_reg_bar || !epf->db_msg) {

Can 'bar' really be 'epf_test->test_reg_bar' here? You just need to check for
NO_BAR, that's it.

Also 'epf->db_msg' can't be NULL here. You were already dereferencing above, so
this check is pointless.

> +		status |= STATUS_DOORBELL_ENABLE_FAIL;
> +		goto set_status;
> +	}
> +
> +	ret = request_irq(epf->db_msg[0].virq, pci_epf_test_doorbell_handler, 0,
> +			  "pci-test-doorbell", epf_test);

'pci-ep-test-doorbell'

> +	if (ret) {
> +		dev_err(&epf->dev,
> +			"Failed to request irq %d, doorbell feature is not supported\n",

'Failed to request doorbell IRQ: %d\n'

> +			epf->db_msg[0].virq);
> +		status |= STATUS_DOORBELL_ENABLE_FAIL;
> +		pci_epf_test_doorbell_cleanup(epf_test);

this can be moved to a err label:

		goto cleanup_doorbell;

> +		goto set_status;
> +	}
> +
> +	reg->doorbell_data = cpu_to_le32(msg->data);
> +	reg->doorbell_bar = cpu_to_le32(bar);
> +
> +	msg = &epf->db_msg[0].msg;
> +	ret = pci_epf_align_inbound_addr(epf, bar, ((u64)msg->address_hi << 32) | msg->address_lo,
> +					 &epf_test->db_bar.phys_addr, &offset);
> +
> +	if (ret) {
> +		status |= STATUS_DOORBELL_ENABLE_FAIL;
> +		pci_epf_test_doorbell_cleanup(epf_test);
> +		goto set_status;
> +	}
> +
> +	reg->doorbell_offset = cpu_to_le32(offset);
> +
> +	epf_test->db_bar.barno = bar;
> +	epf_test->db_bar.size = epf->bar[bar].size;
> +	epf_test->db_bar.flags = epf->bar[bar].flags;
> +
> +	ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, &epf_test->db_bar);
> +	if (ret) {
> +		status |= STATUS_DOORBELL_ENABLE_FAIL;
> +		pci_epf_test_doorbell_cleanup(epf_test);
> +	} else {
> +		status |= STATUS_DOORBELL_ENABLE_SUCCESS;
> +	}
> +

Set the success status directly here:

	status |= STATUS_DOORBELL_ENABLE_SUCCESS;
	reg->status = cpu_to_le32(status);

	return;

cleanup_doorbell:
	pci_epf_test_doorbell_cleanup(epf_test);
set_err_status:
	status |= STATUS_DOORBELL_ENABLE_FAIL;
	reg->status = cpu_to_le32(status);

> +set_status:
> +	reg->status = cpu_to_le32(status);
> +}
> +
> +static void pci_epf_test_disable_doorbell(struct pci_epf_test *epf_test,
> +					  struct pci_epf_test_reg *reg)
> +{
> +	enum pci_barno bar = le32_to_cpu(reg->doorbell_bar);
> +	u32 status = le32_to_cpu(reg->status);
> +	struct pci_epf *epf = epf_test->epf;
> +	struct pci_epc *epc = epf->epc;
> +	int ret;
> +
> +	if (bar < BAR_0 || bar == epf_test->test_reg_bar || !epf->db_msg) {

Same comment about as above for these checks.

> +		status |= STATUS_DOORBELL_DISABLE_FAIL;
> +		goto set_status;
> +	}
> +
> +	ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, &epf->bar[bar]);
> +	if (ret)
> +		status |= STATUS_DOORBELL_DISABLE_FAIL;
> +	else
> +		status |= STATUS_DOORBELL_DISABLE_SUCCESS;
> +
> +	pci_epf_test_doorbell_cleanup(epf_test);
> +
> +set_status:
> +	reg->status = cpu_to_le32(status);
> +}
> +
>  static void pci_epf_test_cmd_handler(struct work_struct *work)
>  {
>  	u32 command;
> @@ -714,6 +847,14 @@ static void pci_epf_test_cmd_handler(struct work_struct *work)
>  		pci_epf_test_copy(epf_test, reg);
>  		pci_epf_test_raise_irq(epf_test, reg);
>  		break;
> +	case COMMAND_ENABLE_DOORBELL:
> +		pci_epf_test_enable_doorbell(epf_test, reg);
> +		pci_epf_test_raise_irq(epf_test, reg);
> +		break;
> +	case COMMAND_DISABLE_DOORBELL:
> +		pci_epf_test_disable_doorbell(epf_test, reg);
> +		pci_epf_test_raise_irq(epf_test, reg);
> +		break;
>  	default:
>  		dev_err(dev, "Invalid command 0x%x\n", command);
>  		break;
> @@ -987,6 +1128,7 @@ static void pci_epf_test_unbind(struct pci_epf *epf)
>  		pci_epf_test_clean_dma_chan(epf_test);
>  		pci_epf_test_clear_bar(epf);
>  	}
> +	pci_epf_test_doorbell_cleanup(epf_test);

Why is this necessary?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

