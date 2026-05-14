Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BECCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYk/2Ca+lmsR7K10O2fsTVNgh9nhiGwX9d4PZByqWaw=; b=qvb/2b96nFiJXqim11+7kXT0PQ
	MyXQhZ4eDBl9AMdBEKKlJMiT+9AK/esxb1gjL9fCb0scISXAdeTN917Dn2JcYkuniGNRgPrdTQwzn
	h8A97uhob24sGSSZLUzxwyE8sB1xEIhqNgWxNlk53VaPUhA2PYGtn+iDiWUggnHPYZ9tGyRsa2ttt
	nfzo2Rv5vrO7atU0bm2+rA25jVSIgHrqxh7jHl81a2BlD/eRpazhwHEQg1Wt+jmhhMDDioO9Du1vX
	oDE9chaI+MpTli27z+OirD50CZXRkCo2Th6+rlUfDj7Tjc7drsz4qp6xGOP3vpaY3s/17agFNSwPe
	LgvNkN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNRAC-00000004uNI-0hCi;
	Thu, 14 May 2026 08:11:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNRAA-00000004uMu-1yxq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 08:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 868F860121;
	Thu, 14 May 2026 08:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08FFC2BCC7;
	Thu, 14 May 2026 08:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778746281;
	bh=K4epJ22JZqnDmCAILYzn9q4Tz0d9iQQNA367BTrZSyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwaS+VedP1H6Mhp7pH/NdKJC+ccQOUh26K1TFAim2CNArA/EDLJ6so8uWMcsKRAWL
	 +kLwvbRBo5z5l2ubvqWpzATl/g7iGy+iIjhSzjhLJbOHNSYvctsomUq2HeMmKFu4CL
	 ffHu4kv5/xBmNPPY5XDwWDT9sLS+AjC6rk1nBKXFtWrj4ck4DZIA0xGnHWJhtn49y2
	 qf7aIskKm4u88XnRxFRX7iYNEwIco2krLzlPyqnAeD2s1y4s03d7wBWtPiCb416OBb
	 NcB6TORA+DE98fhJnx3R4IS3VSHtNY80zl6Aw3dRj54DKtKAW1HILCwN28XJnXjY9b
	 pJJxims2QxPxQ==
Date: Thu, 14 May 2026 13:41:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, 
	kwilczynski@kernel.org, bhelgaas@google.com, corbet@lwn.net, kishon@kernel.org, 
	skhan@linuxfoundation.org, lukas@wunner.de, cassel@kernel.org, alistair@alistair23.me, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, s-vadapalli@ti.com, 
	danishanwar@ti.com, srk@ti.com
Subject: Re: [PATCH v3 4/4] Documentation: PCI: Add documentation for DOE
 endpoint support
Message-ID: <z3a4z3yfrkgfhxvmlkmpgbibs2iab2pm7h7jn2wdniyicwwl3m@l7znjhfxij5v>
References: <20260427051725.223704-1-a-garg7@ti.com>
 <20260427051725.223704-5-a-garg7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427051725.223704-5-a-garg7@ti.com>
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

On Mon, Apr 27, 2026 at 10:47:25AM +0530, Aksh Garg wrote:
> Document the architecture and implementation details for the Data Object
> Exchange (DOE) framework for PCIe Endpoint devices.
> 
> Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Aksh Garg <a-garg7@ti.com>
> ---
> 
> Changes from v2 to v3:
> - Rebased on 7.1-rc1.
> 
> Changes since v1:
> - Squashed the patches [1] and [2], and moved the documentation file
>   to Documentation/PCI/endpoint/pci-endpoint-doe.rst to match the existing
>   naming scheme, as suggested by Niklas Cassel
> - Updated the documentation as per the design and implementaion changes
>   made to previous patches in this series:
>   * Updated for static protocol array instead of dynamic registration
>   * Documented asynchronous callback model
>   * Updated request/response flow with new callback signature
>   * Updated memory ownership: DOE core frees request, driver frees response
>   * Updated initialization and cleanup sections for new APIs
> 
> v2: https://lore.kernel.org/all/20260401073022.215805-5-a-garg7@ti.com/
> v1: [1] https://lore.kernel.org/all/20260213123603.420941-2-a-garg7@ti.com/
>     [2] https://lore.kernel.org/all/20260213123603.420941-5-a-garg7@ti.com/
> 
>  Documentation/PCI/endpoint/index.rst          |   1 +
>  .../PCI/endpoint/pci-endpoint-doe.rst         | 318 ++++++++++++++++++
>  2 files changed, 319 insertions(+)
>  create mode 100644 Documentation/PCI/endpoint/pci-endpoint-doe.rst
> 
> diff --git a/Documentation/PCI/endpoint/index.rst b/Documentation/PCI/endpoint/index.rst
> index dd1f62e731c9..7c03d5abd2ef 100644
> --- a/Documentation/PCI/endpoint/index.rst
> +++ b/Documentation/PCI/endpoint/index.rst
> @@ -9,6 +9,7 @@ PCI Endpoint Framework
>  
>     pci-endpoint
>     pci-endpoint-cfs
> +   pci-endpoint-doe
>     pci-test-function
>     pci-test-howto
>     pci-ntb-function
> diff --git a/Documentation/PCI/endpoint/pci-endpoint-doe.rst b/Documentation/PCI/endpoint/pci-endpoint-doe.rst
> new file mode 100644
> index 000000000000..03b7a69516f3
> --- /dev/null
> +++ b/Documentation/PCI/endpoint/pci-endpoint-doe.rst
> @@ -0,0 +1,318 @@
> +.. SPDX-License-Identifier: GPL-2.0-only or MIT
> +
> +.. include:: <isonum.txt>
> +
> +=============================================
> +Data Object Exchange (DOE) for PCIe Endpoint
> +=============================================
> +
> +:Copyright: |copy| 2026 Texas Instruments Incorporated
> +:Author: Aksh Garg <a-garg7@ti.com>
> +:Co-Author: Siddharth Vadapalli <s-vadapalli@ti.com>
> +
> +Overview
> +========
> +
> +DOE (Data Object Exchange) is a standard PCIe extended capability feature
> +introduced in the Data Object Exchange (DOE) ECN for PCIe r5.0. It is an optional
> +mechanism for system firmware/software running on root complex (host) to perform
> +:ref:`data object <data-object-term>` exchanges with an endpoint function. Each
> +data object is uniquely identified by the Vendor ID of the vendor publishing the
> +data object definition and a Data Object Type value assigned by that vendor.
> +
> +Think of DOE as a sophisticated mailbox system built into PCIe. The root complex
> +can send structured requests to the endpoint device through DOE mailboxes, and
> +the endpoint device responds with appropriate data. DOE mailboxes are implemented
> +as PCIe Extended Capabilities in endpoint devices, allowing multiple mailboxes
> +per function, each potentially supporting different data object protocols.
> +
> +The DOE support for root complex devices has already been implemented in
> +``drivers/pci/doe.c``.
> +
> +How DOE Works
> +=============
> +
> +The DOE mailbox operates through a simple request-response model:
> +
> +1. **Host sends request**: The root complex writes a data object (vendor ID, type,
> +   and payload) to the DOE write mailbox register (one DWORD at a time) of the
> +   endpoint function's config space and sets the GO bit in the DOE Status register
> +   to indicate that a request is ready for processing.
> +2. **Endpoint processes**: The endpoint function reads the request from DOE write
> +   mailbox register, sets the BUSY bit in the DOE Status register, identifies the
> +   protocol of the data object, and executes the appropriate handler.
> +3. **Endpoint responds**: The endpoint function writes the response data object to the
> +   DOE read mailbox register (one DWORD at a time), and sets the READY bit in the DOE
> +   Status register to indicate that the response is ready. If an error occurs during
> +   request processing (such as unsupported protocol or handler failure), the endpoint
> +   sets the ERROR bit in the DOE Status register instead of the READY bit.
> +4. **Host reads response**: The root complex retrieves the response data from the DOE read
> +   mailbox register once the READY bit is set in the DOE Status register, and then writes
> +   any value to this register to indicate a successful read. If the ERROR bit was set,
> +   the root complex discards the response and performs error handling as needed.
> +
> +Each mailbox operates independently and can handle one transaction at a time. The
> +DOE specification supports data objects of size up to 256KB (2\ :sup:`18` dwords).
> +
> +For complete DOE capability details, refer to `PCI Express Base Specification Revision 7.0,
> +Section 6.30 - Data Object Exchange (DOE)`.
> +
> +Key Terminologies
> +=================
> +
> +.. _data-object-term:
> +
> +**Data Object**
> +  A structured, vendor-defined, or standard-defined message exchanged between
> +  root complex and endpoint function via DOE capability registers in configuration
> +  space of the function.
> +
> +**Mailbox**
> +  A DOE capability on the endpoint device, where each physical function can have
> +  multiple mailboxes.
> +
> +**Protocol**
> +  A specific type of DOE communication data object identified by a Vendor ID and Type.
> +
> +**Handler**
> +  A function that processes DOE requests of a specific protocol and generates responses.
> +
> +Architecture of DOE Implementation for Endpoint
> +===============================================
> +
> +.. code-block:: text
> +
> +       +------------------+
> +       |                  |
> +       |   Root Complex   |
> +       |                  |
> +       +--------^---------+
> +                |
> +                | Config space access
> +                |   over PCIe link
> +                |
> +     +----------v-----------+
> +     |                      |
> +     |    PCIe Controller   |
> +     |      as Endpoint     |
> +     |                      |
> +     |  +-----------------+ |
> +     |  |   DOE Mailbox   | |
> +     |  +-------^---------+ |
> +     +----------|-----------+
> +    +-----------|---------------------------------------------------------------+
> +    |           |                                       +--------------------+  |
> +    | +---------v--------+           Allocate           |  +--------------+  |  |
> +    | |                  |-------------------------------->|   Request    |  |  |
> +    | |   EP Controller  |                            +--->|    Buffer    |  |  |
> +    | |      Driver      |             Free           | |  +--------------+  |  |
> +    | |                  |--------------------------+ | |                    |  |
> +    | +--------^---------+                          | | |                    |  |
> +    |          |                                    | | |                    |  |
> +    |          |                                    | | |                    |  |
> +    |          | pci_ep_doe_process_request()       | | |                    |  |
> +    |          |                                    | | |                    |  |
> +    | +--------v---------+             Free         | | |                    |  |
> +    | |                  |----------------------------+ |         DDR        |  |
> +    | |    DOE EP Core   |<----+                    |   |                    |  |
> +    | |    (doe-ep.c)    |     |     Discovery      |   |                    |  |
> +    | |                  |-----+  Protocol Handler  |   |                    |  |
> +    | +--------^---------+                          |   |                    |  |
> +    |          |                                    |   |                    |  |
> +    |          | protocol_handler()                 |   |                    |  |
> +    |          |                                    |   |                    |  |
> +    | +--------v---------+                          |   |                    |  |
> +    | |                  |                          |   |  +--------------+  |  |
> +    | | Protocol Handler |                          +----->|   Response   |  |  |
> +    | |      Module      |-------------------------------->|    Buffer    |  |  |
> +    | | (CMA/SPDM/Other) |           Allocate           |  +--------------+  |  |
> +    | |                  |                              |                    |  |
> +    | +------------------+                              |                    |  |
> +    |                                                   +--------------------+  |
> +    +---------------------------------------------------------------------------+
> +
> +Initialization and Cleanup
> +--------------------------
> +
> +**Framework Initialization and DOE Setup**
> +
> +The EPC core provides the ``pci_epc_doe_setup(epc)`` API for centralized DOE
> +mailbox discovery and registration. The controller driver calls this API during
> +its probe sequence if DOE is supported.
> +
> +This API performs the following steps:
> +
> +1. Calls ``pci_ep_doe_init(epc)``, which initializes the xarray data structure
> +   (a resizable array data structure defined in linux) named ``doe_mbs`` that
> +   stores metadata of DOE mailboxes for the controller in ``struct pci_epc``.
> +2. Discovers all DOE capabilities in the endpoint function's configuration space
> +   for each function. For each discovered DOE capability, calls
> +   ``pci_ep_doe_add_mailbox(epc, func_no, cap_offset)`` to register the mailbox.
> +
> +Each DOE mailbox structure created by ``pci_ep_doe_add_mailbox()`` gets an
> +ordered workqueue allocated for processing DOE requests sequentially for that
> +mailbox, enabling concurrent request handling across different mailboxes. Each
> +mailbox is uniquely identified by the combination of physical function number
> +and capability offset for that controller.
> +
> +**Cleanup**
> +
> +The EPC core provides the ``pci_epc_doe_destroy(epc)`` API for centralized DOE
> +cleanup. The controller driver calls this API during its remove sequence
> +if DOE is supported.
> +
> +This API calls ``pci_ep_doe_destroy(epc)``, which destroys all registered
> +mailboxes, cancels any pending tasks, flushes and destroys the workqueues,
> +and frees all memory allocated to the mailboxes.
> +

As I mentioned in patch 3, we should call these APIs within the EPC core and not
sprinkle throughout the EPC drivers.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

